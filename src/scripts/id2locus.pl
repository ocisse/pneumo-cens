#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
#
use strict;
use Carp;
use IO::All;
use Data::Dumper; 
use feature 'say';

my %locustag = ();
my %ncbiName = ();

my ($f) = io($ARGV[0]);
$f->autoclose(0);
while(my $l =  $f->getline || $f->getline){
chomp $l;
    if ($l =~ m/RefSeq\sgene/){
        my @line = split /\t/, $l;
        my ($locus) = $l =~/(PNEG_\d+|T552\_\d+)/;
        my $key = join("-", $line[0], $line[3], $line[4]);
        $locustag{$key} = $locus;
    } elsif ($l =~ m/RefSeq\smRNA/){
        my @line = split /\t/, $l;
        my $key = join("-", $line[0], $line[3], $line[4]);
        my ($name) = $l =~/Name=(XM_\d+\.\d)/;
        $ncbiName{$key} = $name;
    } else {
        #
    }
}

#say Dumper \%locustag;
#say Dumper \%ncbiName;

# itinerate
my $e = "";
foreach $e (keys %ncbiName){
    if ($locustag{$e}) {
        say "$ncbiName{$e},$locustag{$e}";
    } else {
        say "$ncbiName{$e},NA";
    }
}
