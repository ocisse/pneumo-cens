#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($file,$label) = (undef, undef);
my $verbose;


GetOptions ("file=s" => \$file,
            "label=s" => \$label,
            "verbose" => \$verbose)
or die("Error in command line arguments\n");

my $f = io($file);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    if ($l =~ m/^>/){
        if ($label eq 'Included') {
            say $l;
        } else {
            $l =~s/>/>$label\|/;
            say $l;
        }
    } else {
        say $l; 
    }
}
