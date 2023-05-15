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

my ($cengens, $abundance) = @ARGV;

# load mapping info (name => locus 
my %map = load_info($cengens);
#say Dumper \%map;

# load abundance file
my  %ab  = load_abundance($abundance);
# say Dumper \%ab

# itit
my $e = "";
foreach $e (keys %ab){
    if ($map{$e}){
        say  "$e,$ab{$e},CEN";
    } else {
        say  "$e,$ab{$e},NOT_";
    }
}


sub load_abundance {
    my %h2 = ();    
    my $file = io(@_);
    $file->autoclose(0);
    while(my $fl = $file->getline || $file->getline){
    chomp $fl;
        next if $fl =~ m/^target_id/;
        $fl =~s/^Pm_//;
        my @line = split /\t/, $fl;
        my $id = $line[0];
           $id =~s/Pm_//;
        $h2{$id} = $line[4];
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

