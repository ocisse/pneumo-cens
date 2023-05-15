#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
#
use strict;
use Carp;
use IO::All;
use feature 'say';
use File::Basename;

my $name = basename($ARGV[0]);
   $name =~s/_mnase_cov.bg//;

my $f = io($ARGV[0]);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    my @d = split /\t/, $l;
    my ($id, $st, $ed, $rc) = @d[0..3];
    my $size = ($ed - $st);
    say "$name,$size";
}
