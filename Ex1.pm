#!/usr/bin/perl -w

use Bio::SeqIO;

$seqio = Bio::SeqIO->new(-file => "sequence.gb", -format => "genbank" );

my $fastaSeq;

while( my $seq = $seqio->next_seq ) {
    # process each seq
    $fastaSeq = $seq->seq();
}
my $formattedFastaSeq = "";
my $fromStr = 0;
my $temp = "";

while($fromStr < length($fastaSeq)){

    $temp = substr($fastaSeq, $fromStr, 70);
    $formattedFastaSeq = $formattedFastaSeq.$temp;
    $fromStr = $fromStr + length($temp);
}


print $formattedFastaSeq;
