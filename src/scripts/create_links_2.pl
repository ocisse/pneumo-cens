#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($karyotype1,$karyotype2,$aln,$size) = (undef, undef);
my $verbose;

GetOptions ("kar1=s" => \$karyotype1, # should be the genome ref
            "kar2=s" => \$karyotype2, # the query
            "aln=s"  => \$aln,
            "intervals_size=s" => \$size,
            "verbose" => \$verbose)
or die("Error in command line arguments\n");

# store keyo info key = NW_017264775.1 value = Pj1 
my %k1 = store_karyotype_info($karyotype1);
my %k2 = store_karyotype_info($karyotype2); 

say Dumper \%k1;
say Dumper \%k2;


my $f = io($aln);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    my @data = split /\t/, $l;
    my ($chr1dirty,$ms1,$me1,$chr2dirty,$ms2,$me2) = @data[0..5];
    my $chr1 = "";
    #    if ($chr1dirty  =~m/NW_/){ ($chr1) = $chr1dirty =~/(NW_\d+)\.\d/; } else { $chr1 = $chr1dirty;}
    if ($chr1dirty  =~m/NW_/){ 
        ($chr1) = $chr1dirty =~/(NW_\d+)/; 
    } elsif ($chr1dirty  =~m/Chr/i) {
        ($chr1) = $chr1dirty =~/(Chr\d+)/;
    } else { 
        $chr1 = $chr1dirty;
    }
    my $chr2 = "";
    # if ($chr2dirty  =~m/NW_/){ ($chr2) = $chr2dirty =~/(NW_\d+)\.\d/;} else { $chr2 = $chr2dirty;}
    if ($chr2dirty  =~m/NW_/){ 
        ($chr2) = $chr2dirty =~/(NW_\d+)/;
    } elsif ($chr2dirty  =~m/Chr/i){
        ($chr2) = $chr2dirty =~/(Chr\d+)/;
    } else { 
        $chr2 = $chr2dirty;
    }

    #    say "TEST\t$chr1\txxxxxxx$chr2";
    my $itv1 = ($me1 - $ms1);
    my $itv2 = ($me2 - $ms2);

    if (($itv1 >= $size)  && ($itv2 >= $size)) {
        if (($k2{$chr1}) && ($k1{$chr2})){
            say "$k2{$chr1}  $ms1 $me1 $k1{$chr2} $ms2 $me2";
        } else {
            #  small contigs were filtered out 
        }
    } else {
        # intervals is too small in one of them
    }
}

# subs
sub store_karyotype_info {

    my %h = ();
    my ($kar) = io(@_);
     $kar->autoclose(0);
     while(my $kl = $kar->getline || $kar->getline){
     chomp $kl;
        my @d = split /\s+/, $kl;
        say "TEST\t@d";
        #        $d[6] =~s/\:\d+\-\d+//;
        #$d[6] =~s/\.\d//;
        $h{$d[6]} = $d[2];
     }
     return(%h);
}
