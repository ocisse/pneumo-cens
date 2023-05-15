#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($def) = (undef);
my $verbose;

GetOptions ( "def=s" => \$def, # bed file with the coords 
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");


my %genes2id = ();
my %cen2id = ();

my $fi = io($def);
$fi->autoclose(0);
while (my $l= $fi->getline || $fi->getline){
chomp $l;
    my @d = split /\t/, $l;

    my ($chr,$idall) = ($d[2],$d[9]);
    
    if ($l =~ m/^gene/){
        if ($genes2id{$chr}) {
            my $previous = $genes2id{$chr};
            if ($idall > $previous) {
                $genes2id{$chr} = $idall;
            } else {
                #
            }
        } else {
            $genes2id{$chr} = $idall;
        }
    
    } elsif ($l =~ m/centromere/){
        if ($cen2id{$chr}) {
            my $prev = $cen2id{$chr};
            if ($idall > $prev) {
               $cen2id{$chr} = $idall; 
            } else {
                #
            }
        } else {
            $cen2id{$chr} = $idall;
        }
    }
}

#say Dumper \%genes2id;
#say Dumper \%cen2id;

my @allids = sort(keys %genes2id); 
#say  @allids;

my $e = "";
foreach $e (@allids){
    if ($cen2id{$e}){
        print "$e\t";
    } else {
        #warn"small contig $e:$!\n";
    }
}
print "\n";

my $e1 = "";
foreach $e1 (@allids){
    if ($cen2id{$e1}){
        print "$cen2id{$e1}\t";
    } else {
    
    }
}
print "\n";

my $e2 = "";
foreach $e2 (@allids){
    if ($cen2id{$e2}){
        print "$genes2id{$e2}\t";
    } else {
        #
    }
}
print "\n";
