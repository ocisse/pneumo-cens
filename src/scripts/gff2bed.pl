#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($gff,$bedtype) = (undef,  undef);
my $gfftype = 3; #default
my $verbose;

GetOptions ("gff=s" => \$gff,
            "gfftype=s" => \$gfftype,
            "bedtype=s" => \$bedtype,
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");

 if ($gfftype == 3) {
    parse_gff3($gff);
} elsif ($gfftype == 2){
    parse_gff2($gff);
}
 
# subs
sub parse_gff3 {
    my $g = io(@_);
    $g->autoclose(0);
    while(my $l = $g->getline || $g->getline){
    chomp $l;
        if ($l =~ m/ID=gene/){
            my @d = split /\t/, $l;
            my ($chr,$st,$ed,$strand) = ($d[3], $d[6], $d[7], $d[9]);
            my ($id) = $l =~/Name=(\w+\_\d+);/;
            # BED6: A BED file where each feature is described by chrom, start, end, name, score, and strand.
            # https://bedtools.readthedocs.io/en/latest/content/general-usage.html
            if ($bedtype == 6){
                say "$chr\t$st\t$ed\t$id\t0\t$strand";
            } elsif ($bedtype == 3) {
                say "$chr\t$st\t$ed";
            } else {
                carp"you need to specify the bed format, please!:$!\n";
            }
        } elsif ($l =~ m/GenBank\tgene/){
            my @d = split /\t/, $l;
            my ($chr,$st,$ed,$strand) = ($d[3], $d[6], $d[7], $d[9]);
            my ($id) = $l =~/ID=(PMAC|PORYCT|PCANCK|MERGE\_\d+);/;
            if ($bedtype == 6){
                say "$chr\t$st\t$ed\t$id\t0\t$strand";
            } elsif ($bedtype == 3) {
                say "$chr\t$st\t$ed";
            } else {
                 carp"you need to specify the bed format, please!:$!\n";
            }
        }
    }
}

sub parse_gff2 {
    my $g1 = io(@_);
    $g1->autoclose(0);
    while(my $l1 = $g1->getline || $g1->getline){
    chomp $l1;
        next if $l1 =~ m/^\#/;
        my @d1 = split /\t/, $l1;
        my ($chr1,$st1,$ed1,$strand1, $desc) = ($d1[0], $d1[3], $d1[4], $d1[6], $d1[8]);
        my @tmp = split /\"/, $desc;
        my $id1 = $tmp[1];
           $id1 =~s/Motif://;
            # BED6: A BED file where each feature is described by chrom, start, end, name, score, and strand.
            # https://bedtools.readthedocs.io/en/latest/content/general-usage.html
            if ($bedtype == 6){
                say "$chr1\t$st1\t$ed1\t$id1\t0\t$strand1";
            } elsif ($bedtype == 3) {
                say "$chr1\t$st1\t$ed1";
            } else {
                carp"you need to specify the bed format, please!:$!\n";
            }
        }
}
