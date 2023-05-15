#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
use strict;
use Data::Dumper;
use IO::All;
use feature 'say';

my ($proteome,$ids) = @ARGV;

# load the locus of centromeric genes
my %locusTags = load_tags($ids);
#say Dumper \%locusTags;
# collect all proteins
my %proteins = get_all_proteins($proteome); # key xp_xxxxxx value: T551|T552|PNEG
#say Dumper \%proteins;
# itinerate to find those that are located in the centromeres
my $g = "";
foreach $g (keys %locusTags){
    say "$proteins{$g}\t$g" if $proteins{$g};

}

sub get_all_proteins {
    my %prot = ();

    my $f =io(@_);
    $f->autoclose(0);
    while(my $l = $f->getline || $f->getline){
    chomp $l;
    if ($l =~m/^>/){
            my @d = split /\s+/, $l;
            my $ac = $d[0];
               $ac =~s/>//;
            my $tag = "";
               if ($l =~m/T551_/) {
                    my ($tmp) =  $l =~/(T551_\d+)/;
                        $tag = $tmp;
               } elsif ($l =~m/PMAC_/){
                   my @tmp1 = split /\s+/, $l;
                   my $pmac = $tmp1[0];
                      $pmac =~s/>//;
                      $pmac =~s/\-T\d//;
                      $tag = $pmac;
               } elsif ($l =~m/PORYCT_/){
                   my @tmp1 = split /\s+/, $l;
                   my $po = $tmp1[0];
                      $po =~s/>//;
                      $po =~s/\-T\d//;
                      $tag = $po;
               }  elsif ($l =~m/PCANCK_/){
                    my @tmp1 = split /\s+/, $l;
                    my $pcan = $tmp1[0];
                       $pcan =~s/>//;
                       $pcan =~s/\-T\d//;
                       $tag = $pcan;
               } elsif ($l =~m/T552_/) {
                    my ($tmp) =  $l =~/(T552_\d+)/;
                        $tag = $tmp;
               } elsif ($l =~m/PNEG_/){
                    my ($tmp) =  $l =~/(PNEG_\d+)/;
                        $tag = $tmp;
               }  elsif ($l =~m/MERGE_/){
                    my @tmp1 = split /\s+/, $l;
                    my $pwk = $tmp1[0];
                       $pwk =~s/>//;
                       $pwk =~s/\-T\d//;
                       $tag = $pwk;
               }
               else {
                   # 
               }
            $prot{$tag} = $ac;
    } else {
        #
        }
    }   
    return(%prot);
}

# sub
sub load_tags {
    my %h = ();
    my ($file) = io(@_);
        $file->autoclose(0);
    while(my $fl = $file->getline || $file->getline) {
    chomp $fl;
        $h{$fl} = $fl;
    }
    return(%h);
}
