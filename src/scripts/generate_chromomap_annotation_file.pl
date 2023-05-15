#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use IO::All;
use Carp;
use feature 'say';

my $f=io($ARGV[0]);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    if ($l =~ m/^\d/){
            my @data = split /\t/, $l;
            my ($q,$qs,$qe,$t,$ts,$te) = ($data[9],$data[11],$data[12],$data[13],$data[15],$data[16]);
            #            say"$t\t$ts\t$te";
            say "$q\t$t\t$ts\t$te"
    } else {
        #
    }
}
