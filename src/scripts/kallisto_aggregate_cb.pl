#!/nethome/cisseoh/perl5/perlbrew/perls/perl-5.20.3-thread-multi/bin/perl -w
#
#
use Data::Dumper;
use IO::All;
use Carp;
use feature 'say';

my ($d0,$d7,$d21,$d21c,$rbh) = @ARGV;

my %d0 = load_kallisto($d0);
my %d7 = load_kallisto($d7);
my %d21 = load_kallisto($d21);
my %d21c = load_kallisto($d21c);

# load all genes
#my %pmgenes = get_geneIds($pmgen);
#my %hggenes = get_geneIds($hgen);
#my %msgenes = get_geneIds($mgen);
#say Dumper \%genes;

# get the ortholos
my %groups = process_rbh($rbh);


# combine
say "ID,Pmd0,Hsd0,Msd0,Pmd7,Hsd7,Msd7,Pmd21,Hsd21,Msd21,Pmd21c,Hsd21,Msd21c";

use no warnings; 
my $g = "";
foreach $g (keys %groups){
    my @genes = @{$groups{$g}};
    my ($hg,$ms,$pm) = @genes[0..2];
    say "$g,$d0{$pm},$d0{$hg},$d0{$ms},$d7{$pm},$d7{$hg},$d7{$ms},$d21{$pm},$d21{$hg},$d21{$ms},$d21c{$pm},$d21c{$hg},$d21c{$ms}";
}

# subs
sub process_rbh {
    my %gp = ();
    my $c = 1;
    my $f = io(@_);
    $f->autoclose(0);
    while(my $l = $f->getline || $f->getline){
    chomp $l;
        next if $l =~ m/^#/;
        my @dat = split /\t/, $l;
        @{$gp{"OG$c"}} = @dat;
    }
    return(%gp);
}

sub get_geneIds {
    my %h1 = ();
    my ($f1) = io(@_);
    $f1->autoclose(0);
    while(my $l1 = $f1->getline || $f1->getline){
    chomp $l1;
        if ($l1 =~ m/^>/){
            my @dat = split /\s+/, $l1;
            my $id = shift @dat;
            $id =~s/>//;
            my $rem1 = join("_", @dat);
            $h1{$id} = $rem1;
            #        say "TEST\t$id\t$l1";
        } else {
            #
        }
    }
    #    say Dumper \%h1;
    return(%h1); 
}
sub load_kallisto {
    my %h = ();
    my ($f) = io(@_);
    $f->autoclose(0);
    while(my $l = $f->getline || $f->getline){
    chomp $l;
            next if $l =~ m/^target_id/;
            my @data  = split /\t/, $l;
            my $id = shift @data;
            my $rem = join(",", @data);
            $h{$id} = $rem;
    }
    return(%h);
}




