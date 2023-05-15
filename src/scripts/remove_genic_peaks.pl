#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
#
use strict;
use Data::Dumper;
use IO::All;
use feature 'say';
use Carp;

my $f = io($ARGV[0]);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    my @data = split /\t/, $l;
    if ($data[9] == '0'){
        say $l;
    } else {
        #
    }
}
