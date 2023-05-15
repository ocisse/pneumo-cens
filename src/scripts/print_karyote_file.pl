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

my ($cens, $wgskaryotype) = (undef, undef);
# if those are cens, I need to make sure that the ids are consistent with wgs, so I need the whgs
# if the file is cens you need to make sure it's consistent with the wgs file

GetOptions ("file=s" => \$file,
            "label=s" => \$label,
            "cen=s" => \$cens,
            "wgskaryo=s" => \$wgskaryotype,
            "verbose" => \$verbose)
or die("Error in command line arguments\n");

if ((defined($cens)) && (defined($wgskaryotype))){

    my $f = io($file);
    $f->autoclose(0);
    while(my $l = $f->getline || $f->getline){
    chomp $l;
        next if $l =~ m/ctg/;
        my @d = split /\s+/, $l; # e.g. NW_006920861:241522-253620  12098
        #           say "TEST1\t@d";
        my $chrinfo = $d[0]; # e.g. NW_006920861:241522-253620
        my @info = split /\:/, $chrinfo;   
        my $chrid = $info[0]; # e.g. NW_006920861
        my @info2 = split /\-/, $info[1];

        my ($start, $end) = ($info2[0],$info2[1]);

        my %chrswgs = get_karyotype_data($wgskaryotype); # chr - pm10 10 0 376022 NW_006920861 would return 'NW_006920861' => 'pm10'
        #        say Dumper \%chrswgs;
        my $c = $chrswgs{$chrid};
        #say "TEST3\t$c";
           $c =~s/$label//;
        say "chr -  $chrswgs{$chrid} $c $start $end $chrinfo";
    }
} else {
    my $c = 1;
    my $f = io($file);
    $f->autoclose(0);
    while(my $l = $f->getline || $f->getline){
    chomp $l;
        next if $l =~ m/ctg/;
        my @d = split /\t/, $l;
        say "chr - $label$c $c 0 $d[1] $d[0]";
        $c++;
    }
}

## subs
sub get_karyotype_data{
    my %h = ();
    my ($kfile) = io(@_);
    $kfile->autoclose(0);
    while(my $kl = $kfile->getline || $kfile->getline){
    chomp $kl;
        my @dk = split /\s+/, $kl; # chr - pm10 10 0 376022 NW_006920861
        $h{$dk[6]} = $dk[2];
    }
    return(%h);
}
