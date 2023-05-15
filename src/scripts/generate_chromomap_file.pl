#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use feature 'say';
use Carp;
use IO::All;
use Data::Dumper;


my ($tab,$bed) = @ARGV;

my %tab = load_data($tab);
my %bed = load_data($bed);

#say Dumper \%tab, \%bed;
# print report
my $c = "";
foreach $c (keys %tab){
    if ($bed{$c}){
        say "$c\t1\t$tab{$c}\t$bed{$c}";
    } else {
        say "$c\t1\t$tab{$c}";
    }
}
# subs
sub load_data {
    my %h = ();
    my $f = io(@_);
    $f->autoclose(0);
    while(my $l = $f->getline || $f->getline){
    chomp $l;
        my @d = split /\t/, $l;
        $h{$d[0]} = $d[1];
    }
    return(%h);
}   
