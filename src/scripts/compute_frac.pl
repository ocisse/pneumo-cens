#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my $bedgraph =  undef
my $verbose;

my $cutoff = 1; # 1x 

GetOptions ("bg=s" => \$bedgraph, 
            "cutoff=s" => \$cutoff,
            "verbose" => \$verbose)
or die("Error in command line arguments\n");

#
my $nbins = 0;
my $ntotalbins = 0;

my $f = io($bedgraph);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    my @data = split /\t/, $l;
    my ($chr,$bstart,$bend,$cov) = @data[0..3];
    if ($cov >= $cutoff) {
        $nbins++;
    } else {
        #
    }
    $ntotalbins++;
}
my $frac = $nbins/$ntotalbins;
my $rounded = sprintf("%.2f", $frac);
my $perc = ($rounded * 100);

say "#FILE:\t\"$bedgraph\"\tnbins covered:\t$nbins\ttotalBins:\t$ntotalbins\tgenome fraction covered w $cutoff x RPGC:\t$perc%";

