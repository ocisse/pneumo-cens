#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($gff,$tag) = (undef, undef);
my $verbose;

GetOptions ("gff=s" => \$gff, 
            "tag=s" => \$tag, 
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");

my $count = 1;
my $buf = "";
my ($f) = io($gff);
$f->autoclose(0);
while (my $l = $f->getline || $f->getline ){
chomp $l;
    if ($l =~ m/^##/){
        say $l;
    } else {
        if ($l =~ m/ID=/){
            my @data = split /\t/, $l;
            my ($chr,$src,$type,$start,$end,$size,$strand,$atr) = @data[0..7]; 
            say "$chr\t$src\tgene\t$start\t$end\t.\t$strand\t.\tID=$tag;";
            say "$chr\t$src\tmRNA\t$start\t$end\t.\t$strand\t.\tID=$tag-T1;Parent=$tag;product=hypothetical protein;";
        } elsif ($l =~ m/Parent=/){
            my @data1 = split /\t/, $l;
            my ($chr,$src,$type,$start,$end,$score,$strand,$phase,$atr) = @data1[0..8];
            say "$chr\t$src\texon\t$start\t$end\t.\t$strand\t.\tID=$tag-T1.exon$count;Parent=$tag-T1;";
            $buf .="$chr\t$src\tCDS\t$start\t$end\t.\t$strand\t0\tID=$tag-T1.cds;Parent=$tag-T1;\n";
            $count++;
        } else {
            warn"Error\n";
        }
    }
}
say $buf;

