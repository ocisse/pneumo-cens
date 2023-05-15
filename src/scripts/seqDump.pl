#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($file,$size) = (undef, undef);
my $verbose;

GetOptions ("file=s" => \$file,
            "size=s" => \$size,
            "verbose" => \$verbose)
or die("Error in command line arguments\n");

my $f = io($file);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    my @d = split /\t/, $l;
    my ($chr,$len) = ($d[0],$d[1]);

    unless ($size > $len){
        say "$chr\t$len";
    }
}
