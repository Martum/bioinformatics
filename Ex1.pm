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

my $seq_obj = Bio::Seq->new(
    -seq => $formattedFastaSeq,
    -alphabet => 'dna' );

@seqs = Bio::SeqUtils->translate_6frames($seq_obj);

printf "orf 1\n";
print $seqs[0]->seq, "\n";
printf "orf 2\n";
print $seqs[1]->seq, "\n";
printf "orf 3\n";
print $seqs[2]->seq, "\n";
printf "orf 4\n";
print $seqs[3]->seq, "\n";
printf "orf 5\n";
print $seqs[4]->seq, "\n";
printf "orf 6\n";
print $seqs[5]->seq, "\n";
