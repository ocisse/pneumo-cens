#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Bio::SeqIO;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($f1,$f1) = (undef, undef, undef);
my $verbose;

my $prog = 'needle'; # default'

GetOptions ("f1=s" => \$f1,
            "f2=s" => \$f2,
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");

# put the sequences in a hash
my %seqs1 = get_seqs($f1); 
my %seqs2 = get_seqs($f1); 

# iterate to pairse
# subs
sub get_seqs {
    my ($fas) = @_;
    my %seqs = ();
    my $seqio = Bio::SeqIO->new(-file => $fas, -format => "fasta"); 
    while(my $seqobj = $seqio->next_seq) {
        my $id = $seqobj->display_id;
        my $seq = $seqobj->seq;
           $seqs{$id} = $seq;
        }
   return(%seqs);
}
 $b->autoclose(0);
 while(my $l = $b->getline || $b->getline){
 chomp $l;
    my @d = split /\t/, $l;
    my $rg = "$d[0]:$d[1]-$d[2]";
    my $name = $rg;
       $name =~s/\:/_/;
    run("pyGenomeTracks --tracks $track --region $rg --trackLabelFraction 0.2 --dpi 300 -o $name.$tag.$format");
 }

 # sub
 sub run {
    my ($cmd) = @_;
    warn"running: \"$cmd\"\n";
    system($cmd)==0 || die "cannot run $cmd:$!\n";
 }
