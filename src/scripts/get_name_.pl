#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
#
use strict;
use Carp;
use IO::All;
use Data::Dumper; 
use feature 'say';


my ($map, $bed6) = @ARGV;

# load mapping info (locustag => ncbi name 
my %map = load_info($map);
#say Dumper \%map;

# load centromeric genes (locus tag
my  %locustags  = load_bed6($bed6); # bed6 contains the genes located in the centromeres
# say Dumper \%ab

# itit
my $e = "";
foreach $e (keys %locustags){
    say  "$e,$map{$e}";
}


sub load_bed6 {
    my %h2 = ();    
    my $file = io(@_);
    $file->autoclose(0);
    while(my $fl = $file->getline || $file->getline){
    chomp $fl;
        my @line = split /\t/, $fl;
        $h2{$line[3]} = $line[0]
    }
    return %h2;
}

# subs
sub load_info {
    my %h = ();
    my ($f) = io(@_);
    $f->autoclose(0); 
    while(my $l =  $f->getline || $f->getline){
    chomp $l;
        my @line = split /\,/, $l;
        $h{$line[1]} = $line[0];
    }
    return %h;
}

