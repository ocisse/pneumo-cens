#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use IO::All; 
use Carp;
use feature 'say';


my $f = io($ARGV[0]);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    my @data = split /\t/, $l;
    my ($chr, $st, $ed) = @data[0..2];

    my $st2 = $st + 1;
    say "$chr\t$st\t$st2";
    my $ed2 = $ed + 1;
    say "$chr\t$ed\t$ed2";

}
