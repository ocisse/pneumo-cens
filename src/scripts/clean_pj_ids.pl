#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
#
use strict;
use Data::Dumper;
use IO::All;
use feature 'say';


my $f =io($ARGV[0]);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    $l =~s/_Pneumocystis_jirovecii_RU7_chromosome_Unknown_supercont\d\.\d+,_whole_genome_shotgun_sequence//;
    say $l;
}
