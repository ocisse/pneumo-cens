#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use feature 'say';
use Carp;
use IO::All;
use Data::Dumper;


my $c = 1;
my $f = io($ARGV[0]);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    if ($l =~m/NW_/){
        my @d = split /\t/, $l;
        say ">r$c";
        $d[2] =~s/^\s//;
        say $d[2];
        $c++;
    } else {
        next;
    }
}
