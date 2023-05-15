#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;
use Array::Utils qw(:all);
use List::Util 'shuffle';

my ($bed,$gff,$nsize,$bedtype) = (undef, undef, undef, undef);
my $verbose;

GetOptions ("bed=s" => \$bed,
            "gff=s" => \$gff,
            "nsize=s" => \$nsize,
            "bedtype=s" => \$bedtype,
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");

my %bed = store_bed_ids($bed);
my %allids = get_ids($gff);

#say Dumper \%allids;
# get ids that are not in ce
my @cen = (keys %bed);
my @allids = (keys %allids); 

# get items from array @a that are not in array @b
#my @minus = array_minus( @a, @b );
my @noncen = array_minus( @allids, @cen);
my @shuffled = shuffle(@noncen);

my @sample = splice @shuffled, 0, $nsize;

# print the bed
my $name = ""; 
foreach $name (@sample){
    my $info = $allids{$name};
    $info =~s/,/\t/g;
    say $info;
}

# subs
sub get_ids {
    my %h = ();
    my $g = io(@_);
    $g->autoclose(0);
    while(my $l = $g->getline || $g->getline){
    chomp $l;
        if ($l =~ m/ID=gene/){
            my @d = split /\t/, $l;
            my ($chr,$st,$ed,$strand) = ($d[0], $d[3], $d[4], $d[6]);
            my ($id) = $l =~/Name=(\w+\_\d+);/;
            # BED6: A BED file where each feature is described by chrom, start, end, name, score, and strand.
            # https://bedtools.readthedocs.io/en/latest/content/general-usage.html
            if ($bedtype == 6){
                my $info = join(",", $chr,$st,$ed,$id,0,$strand) if ($id);
                $h{$id} = $info if ($id);
            } elsif ($bedtype == 3) {
                my $info = join(",", $chr,$st,$ed);
                $h{$id} = $info;
            } else {
                carp"I need you to tell me what type of bed you want ...:$!\n";
            }
        } else {
            next;
        }
    }
    return(%h);
}
sub store_bed_ids {
    my %h = ();
    my $b = io(@_);
    $b->autoclose(0);
    while(my $l = $b->getline || $b->getline){
    chomp $l;
        my @d = split /\t/, $l;
        $h{$d[3]}++;
    }
    return(%h);
}

