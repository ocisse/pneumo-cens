#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($fas,$tag) = (undef, undef);
my $verbose;

GetOptions ("fasta=s" => \$fas,
            "tag=s" => \$tag,
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");

my $f = io($fas);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    if ($l =~ m/^>/){
        $l =~s/>/>$tag|/;
        say $l;
    } else {
        say $l;
    }
}
