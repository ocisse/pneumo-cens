#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;
use File::Basename;

my ($bamlist,$bed,$outfile) = (undef, undef, undef);
my $verbose;

my $threads = 1; # default

GetOptions ("bamlist=s" => \$bamlist,
            "threads=s" => \$threads,
            "bed=s" => \$bed,
            "outfile=s" => \$outfile,
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");

# load bam files
my @bamfiles = load_bam_files($bamlist); 
my $bamfiles = join(' ', @bamfiles); 

# get the directory
my $outdir  = dirname($outfile);

# iterate through the bed
my @indCounts = ();
my @cleanup =();

my $b = io($bed);
$b->autoclose(0);
while(my $l = $b->getline || $b->getline){
chomp $l;
    my @d = split /\t/, $l;
    my $rg = "$d[0]:$d[1]:$d[2]";
    #       $rg =~s/\:/_/g;
    my $name = $d[3]; # this is the locus tag
    run("echo \"$l\" > $outdir/$name.bed");
    run("plotEnrichment -p $threads -b $bamfiles --BED $outdir/$name.bed -r $rg --outRawCounts $outdir/$name.tab");
    push(@indCounts, "$outdir/$name.tab");
    push(@cleanup, "$outdir/$name.tab", "$outdir/$name.bed");
}

# concatenate everything into one file
my $f = "";
foreach $f (@indCounts) {
    run("cat $f >> $outfile");
}

# cleanup
my $fs = "";
foreach $fs (@cleanup){
    run("unlink $fs");
}

# sub
sub load_bam_files {
    my @bams = ();
    my $dat = io(@_);
    $dat->autoclose(0);
    while(my $dl = $dat->getline || $dat->getline){
    chomp $dl;
        push(@bams, $dl);
    }   
    return(@bams);
}

sub run {
    my ($cmd) = @_;
    warn"running: \"$cmd\"\n";
    system($cmd)==0 || warn "cannot run $cmd:$!\n";
 }
