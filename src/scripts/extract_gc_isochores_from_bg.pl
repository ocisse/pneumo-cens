#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my $bg = undef;
my $cutoff = 0.5; # default
my $verbose;

GetOptions ("bedgraph=s" => \$bg,
            "ct=s" => \$cutoff,
            "verbose" => \$verbose)
or die("Error in command line arguments\n");

my $f = io($bg);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    my @data = split /\t/, $l;
    my ($chr,$st,$end,$val) = @data[0..3];
    say $l if ($val > $cutoff);

}
