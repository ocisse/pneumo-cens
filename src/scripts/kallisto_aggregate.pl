#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;

use Data::Dumper;
use IO::All;
use Carp;
use feature 'say';
use Getopt::Long;
my ($cu, $d0,$d7,$d21,$d21c,$ca, $con, $geneFa) = @ARGV;

my $cutoff = "5";
my $binary = 'False' ; # do you want a binary file
my $verbose;
GetOptions ( "cutoff=i" => \$cutoff, # bed file with the coords
             "binary=s" => \$binary, 
             "verbose" => \$verbose)
             or die("Error in command line arguments\n");



my %d0 = load_kallisto($d0);
#say Dumper \%d0;
my %d7 = load_kallisto($d7);
#say Dumper \%d7;
my %d21 = load_kallisto($d21);
#say Dumper \%d21;
my %d21c = load_kallisto($d21c);
#say Dumper \%d21c;
#
my %cu = load_kallisto($cu);
my %ca= load_kallisto($ca);
my %con= load_kallisto($con);

# load all genes
my %genes = get_geneIds($geneFa);
#say Dumper \%genes;

# combine
print "geneID,cu,d0,d7,d21,d21c,casp,con,desc\n";

my $g = "";
foreach $g (keys %genes){
    say "$g,$cu{$g},$d0{$g},$d7{$g},$d21{$g},$d21c{$g},$ca{$g},$con{$g},$genes{$g}";
}

# subs
sub get_geneIds {
    my %h1 = ();
    my ($f1) = io(@_);
    $f1->autoclose(0);
    while(my $l1 = $f1->getline || $f1->getline){
    chomp $l1;
        if ($l1 =~ m/^>/){
            my @dat = split /\s+/, $l1;
            my $id = shift @dat;
            $id =~s/>//;
            my $rem1 = join("_", @dat);
            $rem1 =~s/Pneumocystis_murina_B123_//;
            $rem1 =~s/,_variant_partial_mRNA//;
            $rem1 =~s/_partial_mRNA//;
            $rem1 =~s/_mRNA//;
            $rem1 =~s/,_variant//;
            $rem1 =~s/,//g;
            $h1{$id} = $rem1;
            #        say "TEST\t$id\t$l1";
        } else {
            #
        }
    }
    #    say Dumper \%h1;
    return(%h1); 
}
sub load_kallisto {
    my %h = ();
    my ($f) = io(@_);
    $f->autoclose(0);
    while(my $l = $f->getline || $f->getline){
    chomp $l;
            next if $l =~ m/^target_id/;
            my @data  = split /\t/, $l;
            my $id = shift @data;
            my $tpm = $data[3];

            if ($binary eq 'True'){
                if ($tpm > $cutoff) {
                    $h{$id} = '1';
                } else {
                     $h{$id} = '0';
                }
            } else {
                 $h{$id} = $tpm,
            } 
    }
    return(%h);
}




