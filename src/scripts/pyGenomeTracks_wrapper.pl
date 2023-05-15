#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use Carp;
use IO::All;
use feature 'say';
use Getopt::Long;

my ($bed,$track, $tag) = (undef, undef, undef);
my $verbose;

my $format = 'pdf';

GetOptions ("bed=s" => \$bed,
            "track=s" => \$track,
            "tag=s" => \$tag,
            "format=s" => \$format,
            "verbose" => \$verbose)
            or die("Error in command line arguments\n");

 my $b = io($bed);
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
