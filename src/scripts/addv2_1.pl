#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';


 my $b = io($ARGV[0]);
 $b->autoclose(0);
 while(my $l = $b->getline || $b->getline){
 chomp $l;
    my @d = split /\t/, $l;
    #    say "$d[0].1\t$d[1]\t$d[2]";
   my $id = shift @d;
      $id .=".1";
    unshift(@d,$id);
    my $mod = join("\t", @d);
    say $mod;
}

