#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
use strict;
use IO::All;
use feature 'say';
use Getopt::Long;
use File::Basename;

my ($file,$tag) = (undef, undef);
my $verbose;

my $score = 0; # default
my $min = 30;
my $max = 200; 
my $deletetmp = 'False';

GetOptions ("in=s" => \$file, 
            "tag=s"  => \$tag,
            "scr=s" => \$score,
            "min=s" => \$min,
            "max=s" => \$max,
            "delete-tmp=s" => \$deletetmp,
            "verbose" => \$verbose)
or die("Error in command line arguments\n");

my @cleanup = ();
my @merged = (); 

my $dirname  = dirname($file);
my $io = io($dirname); 
my @contents = @$io;

my $f = "";
foreach $f (@contents){
    if (($f =~m/$tag/) && ($f =~m/\.bam/)){
        #        say $f;
        my $bed = $f;
           $bed =~s/\.bam/\.bed/;
           #run("bash ../tools/PuFFIN/bam2bedpe.sh $f > $bed");
        if (-z $bed){
            # 
        } else {
            #run("/hpcdata/dcr_cc/Ousmane_Data/projects/Pneumo_Comp_Genomics/temp/data/cisseoh/conda/envs/py2/bin/python ../tools/PuFFIN/Run.py $bed");
            filter_results("$bed.nucs","$bed.nucs.flt");
            convert2bed("$bed.nucs.flt", "$bed.nucs.flt.bed");
            push(@merged, "$bed.nucs.flt.bed");
            push(@cleanup, $bed,"$bed.nucs.flt","$bed.nucs.flt.bed");
        }
    }
}

my $merge = $file;
   $merge =~s/\.bam/.nucleosome\.bed/;
   #   $merge = "";
run("unlink $merge") if (-e $merge);

merge(\@merged,\$merge);
cleanup(@cleanup) if ($deletetmp eq 'True');

# sub
sub cleanup {
    my (@cleanup) = @_;

    my $cl = "";
    foreach $cl (@cleanup){
        run("unlink $cl");
    }
}
sub merge {
    my ($filesList,$mergeFile) = @_;

    my @list = @$filesList;
    my $merge = $$mergeFile;

    my $fil = "";
    foreach $fil (@list) {
        run("cat $fil >> $merge");
        #       warn"$fil...\t:$!\n";
    }
}
sub convert2bed {
    my ($infile,$outfile) = @_;
 
    # extract the  chr name
    my $name = basename($infile);
    #    say "TEST1\t$name";
    my @tmp = split /REF_/, $name;
    my $chr = $tmp[1];
       $chr =~s/\.bed\.nucs\.flt//;
  
       #    say "TEST\t$chr"; 
    my $buf2 = "";
    my $fi = io($infile);
    $fi->autoclose(0);
    while(my $li = $fi->getline || $fi->getline){
    chomp $li;
        my @di = split/\t/, $li;
        my ($loci,$pkwidthi,$scori,$stdi,$curi) = @di[0..4];
            my $centroid = sprintf("%.0f", $loci);
            my $half = sprintf("%.0f", ($pkwidthi / 2));
            my $start = $centroid - $half;
            my $end = $centroid + $half;
            #            my $end = $start + $pkwidthi;
            #warn"TEST3\t$chr\t$start\t$end...:$!\n";
            $buf2 .="$chr\t$start\t$end\n";
    }
    io($outfile)->write($buf2);
}
sub filter_results {
    my $buf = "";
    my ($in,$out) = @_;
    my $f = io($in);
    $f->autoclose(0);
    while(my $l = $f->getline || $f->getline){
    chomp $l;
        next if $l =~m/^#/;
        my @d = split/\t/, $l;
        # Location      Peak_width      Score   STD(fuzziness)  Curve_level
        my ($loc, $pkwidth,$scor,$std,$cur) = @d[0..4];
        if (($scor > $score) && ($min < $pkwidth) && ($max >= $pkwidth)){
            $buf .= "$l\n";
        } else {
            next;
        }
    }
    warn"writing $out...$!\n";
    io($out)->write($buf);
} 
sub run {
    my ($cmd) = @_;
    warn"\trunning\t$cmd:$!\n";
    system($cmd)==0 || die "cannot run $cmd:$!\n";
}
