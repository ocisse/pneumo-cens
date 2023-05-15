#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';

my ($cengens,$noncengenes) = @ARGV;

my ($genesCen, $cuCen,$caCen, $conCen, $d0Cen, $d7Cen, $d21Cen) = get_data($cengens);
my ($genes, $cu,$ca, $con, $d0, $d7, $d21) = get_data($noncengenes);

#say Dumper $cuCen; 
my %genesCen = %$genesCen;
my %cuCen = %$cuCen;
my %caCen = %$caCen;
my %conCen = %$conCen;
my %d0Cen = %$d0Cen;
my %d7Cen = %$d7Cen;
my %d21Cen = %$d21Cen;


my %genes = %$genes;
my %cu = %$cu;
my %ca = %$ca;
my %con = %$con;
my %d0 = %$d0;
my %d7 = %$d7;
my %d21 = %$d21;

# print report
say "id,cu,ca,con,d0,d7,d21,desc";
my $g = "";
foreach $g (keys %genesCen) {
        say "$g,$cuCen{$g},$caCen{$g},$conCen{$g},$d0Cen{$g},$d7Cen{$g},$d21Cen{$g},cen";
}
my $g1 = "";
foreach $g1 (keys %genes){
        say "$g1,$cu{$g1},$ca{$g1},$con{$g1},$d0{$g1},$d7{$g1},$d21{$g1},gen";
}

# sub
sub get_data {
    my %cu = ();
    my %ca = ();
    my %con = ();
    my %d0 = ();
    my %d7 = ();
    my %d21 = ();
    my %genes = ();
    my $dat = io(@_);
    $dat->autoclose(0);
    while(my $dl = $dat->getline || $dat->getline){
    chomp $dl;
        next if $dl =~ /^file/;
        my @data = split /\t/, $dl;
        my ($locus, $count) = ($data[1], $data[3]);
        $locus =~s/\.bed//;
        if ($dl =~m/PNEG_/){
            if ($dl =~ m/A549_PCAligned/) { $cu{$locus} = $count }
            elsif ($dl =~ m/Caspo_2Aligned/) { $ca{$locus} = $count }
            elsif ($dl =~ m/Control_10Aligned/) { $con{$locus} = $count }
            elsif ($dl =~ m/d0Aligned/) { $d0{$locus} = $count }
            elsif ($dl =~ m/d7Aligned/) { $d7{$locus} = $count }
            elsif ($dl =~ m/d21Aligned/) { $d21{$locus} = $count }
            else {
                die "something is wrong:$!\n";
            }
            $genes{$locus}++;
        } else {
            # to impl for P.carinii
        }        
    }   
    return(\%genes, \%cu,\%ca, \%con, \%d0, \%d7, \%d21);
}

sub run {
    my ($cmd) = @_;
    warn"running: \"$cmd\"\n";
    system($cmd)==0 || warn "cannot run $cmd:$!\n";
 }
