#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w 
#
#
use strict;
use Data::Dumper;
use IO::All;
use Carp;
use File::Basename;
use Getopt::Long;

my ($bed,$dir,$odir) = ('','','');
my $verbose;

GetOptions ("bed=s" => \$bed,
            "dir=s" => \$dir,
            "odir=s" => \$odir,
            "verbose" => \$verbose)
or die("Error in command line arguments\n");


my $f = io($bed);
$f->autoclose(0);
while(my $l = $f->getline || $f->getline){
chomp $l;
    my @data = split /\t/, $l;
    my ($chr,$start,$end) = @data[0..2];
    my $buf = "";
       $buf .="$chr\t$start\t$end\n";
       io("$dir/peak.$chr.$start.$end.bed")->write($buf);
       run("python ../scripts/Genbank_slicer.py -g $odir/$chr.gbk -o $dir/peak.$chr.$start.$end.gbk -s $start -e $end"); # better to reimplement in pure perl or py
       run("perl ../scripts/gbk2fasta/gbk2fasta.pl $dir/peak.$chr.$start.$end.gbk $dir/peak.$chr.$start.$end.fa");
   }

# subs
sub run {
    my ($cmd) = @_;
    warn"running ...\t$cmd\n";
    system($cmd)==0 || die "cannot run $cmd:$!\n";
}

