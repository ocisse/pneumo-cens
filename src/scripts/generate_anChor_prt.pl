#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($fasta,$def) = (undef, undef);
my $verbose;

GetOptions ("fasta=s" => \$fasta, # all proteins including those located in small contigs that lack cen
            "def=s" => \$def, # bed file with the coords 
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");


my %def = load_def($def); # contains only scafs w cen i.e. the big ones
#say Dumper \%def; 

my $f = io($fasta);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    if ($l =~ m/^>/){
        my @info = split /\s+/, $l;
        my $id = $info[0];
        $id =~s/>//;
        if ($def{$id}) {
            my $desc = $def{$id};
            $desc =~s/^gene\t//;
            $desc =~s/^centromere\t//;
            say ">$desc";
        } else {
            say "$l\t[SMALL_CTG]";
        }
        } else {
            say $l;
        }
}

sub load_def {
    my %h = ();

    my $fi = io(@_);
    $fi->autoclose(0);
    while (my $l= $fi->getline || $fi->getline){
    chomp $l;
        my @d = split /\t/, $l;
        $h{$d[1]} = $l;
    }
    return(%h);
}
