#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use feature 'say';
use Carp;

use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my $bed = undef;
my $ext = 500; # default match len
my $verbose;

GetOptions ("bed=s" => \$bed,
            "ext=s" => \$ext,
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");

                                #
my $f = io($bed);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    my @d = split /\t/, $l;
    my ($chr,$st,$end) = @d[0..2];
    my $mid = ($st + $end) / 2;
    my $left = sprintf("%.0f", ($mid - $ext));
    my $right = sprintf("%.0f",($mid + $ext));
    say "$chr\t$left\t$right";
}
