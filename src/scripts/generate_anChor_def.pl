#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($gff,$cen) = (undef, undef);
my $gfftype = 3; #default
my $verbose;

GetOptions ("gff=s" => \$gff,
            "cen=s" => \$cen, # bed file with the coords 
            "gfftype=s" => \$gfftype,
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");

say "type\tname\tchr\tstart\tend\tstrand\tsens\tIDg/chr\tIDg/all\tIDf/all";

#gene    YALI0A00110g    001     2659    5277    +       t       00001   00001   00001
#gene    YALI0A00132g    001     7045    8880    +       t       00002   00002   00002
#gene    YALI0A00154g    001     11559   12653   +       t       00003   00003   00003

 if ($gfftype == 3) {
    parse_gff3($gff);
} elsif ($gfftype == 2){
    parse_gff2($gff);
}
# need to to map the protein id to the locus; this is not in the gene line, so need to extract separately
#


# subs
sub parse_gff3 {
    my %locustag2id = map_id($gff);
    my %centromerePos = get_pos($cen);

    my $counter = 1;
    #    say Dumper \%locustag2id; 
    
    my $g = io(@_);
    $g->autoclose(0);
    while(my $l = $g->getline || $g->getline){
    chomp $l;
        next if $l =~m/^#/;
        if ($l =~ m/ID=gene/){
            my @d = split /\t/, $l;
            my ($chr,$st,$ed,$strand) = ($d[0], $d[3], $d[4], $d[6]);
            my ($id) = $l =~/Name=(\w+\d+\_\d+|PNEG\_\d+);/;
            my $orient2cen = get_orientation($chr,$st,$cen); # need to compute orientation relative to the centromere
            # if orient2cen not defined  means these are small ctigs withouth cens, drop them#            
                
            my $strlen = length($counter);
            my $adjustedCounter = adjust_zeros($counter, $strlen);
            
            if ($orient2cen eq 'centromere') {
                say "centromere\t$locustag2id{$id}\t$chr\t$st\t$ed\t$strand\tt\t$adjustedCounter\t$adjustedCounter\t$adjustedCounter"; 
            } elsif ($orient2cen ne 'centromere') {
                if ($locustag2id{$id}) {
                    say "gene\t$locustag2id{$id}\t$chr\t$st\t$ed\t$strand\t$orient2cen\t$adjustedCounter\t$adjustedCounter\t$adjustedCounter";
                } else {
                    say "gene\t$id\t$chr\t$st\t$ed\t$strand\t$orient2cen\t$adjustedCounter\t$adjustedCounter\t$adjustedCounter";
                }
            } else {
                next;
            }
        $counter++;
        }
    }
}

### subs
sub adjust_zeros {
    my ($c,$len) = @_;

    if ($len == 1) {
        return("0000$c");
    } elsif ($len == 2) {
        return("000$c")
    } elsif ($len == 3) {
        return("00$c")
    } elsif ($len == 4) {
        return("0$c")
    } else {
        return($c);
    }
}

sub get_orientation {
    my ($chrName,$pos, $bed) = @_;
    my %cen = ();
    my $f = io($bed);
    $f->autoclose(0);
    while(my $fl = $f->getline || $f->getline){
    chomp $fl;
        if ($fl =~m/^$chrName/){
                my @info = split /\t/, $fl;
                my ($chrid,$start,$end) = @info[0..2];
                if ($pos < $start){
                    return("t");
                } elsif ( ($start <  $pos) && ($pos < $end)) {
                    return("centromere")
                } elsif ($pos > $end) {
                    return("f");
                } else {
                    die "Error:$!";
                }
        } else { # the chr is one the small ctgs ; no cen there because there likely incomplete
            #return("smallctg");
        }
    }
}

sub map_id {
    my %h = ();

    my %geneid2ocustag = ();
    my %geneid2protid = ();

    my $fi = io(@_);
    $fi->autoclose(0);
    while (my $l1= $fi->getline || $fi->getline){
    chomp $l1;
       if (($l1 =~ m/protein_id=XP_/) && ($l1 =~ m/mrna_/)){
            my ($id) = $l1 =~/(XP_\d+\.\d)/;
            my ($tag) = $l1 =~/mrna_(\w+\d+\_\d+)/;
            $h{$tag} = $id;
       } elsif ($l1 =~m/RefSeq\sgene/) { # in pmur gff there is no mrna_
            my ($geneid) = $l1 =~/GeneID:(\d+)/;
            my ($locustag) = $l1 =~/locus_tag=(PNEG_\d+)/;
            $geneid2ocustag{$geneid} = $locustag;
       } elsif ($l1 =~m/RefSeq\sCDS/){
            my ($geneid) = $l1 =~/GeneID:(\d+)/;
            my ($protid) = $l1 =~/protein_id=(XP_\d+\.\d)/;
            $geneid2protid{$geneid} = $protid;
       } else {
           next; 
       }
       # map
       my $e = "";
       foreach $e (keys %geneid2ocustag){
           my $tag = $geneid2ocustag{$e};
           my $prot = $geneid2protid{$e};
           $h{$tag} = $prot if (defined $tag);
       }
   }
    return(%h);
}

sub get_pos {
    my %h = ();
    my $f = io(@_);
    $f->autoclose(0);
    while (my $l = $f->getline || $f->getline){
    chomp $l;
        my @dat = split /\t/, $l;
        @{$h{$dat[0]}} = (@dat[1..2]);
    }
    return(%h);
}

