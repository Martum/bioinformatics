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

print $fh $formattedFastaSeq;

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

my $seqout1 = Bio::SeqIO->new(-file => ">orf1.fa", -format => "fasta");
my $seqout2 = Bio::SeqIO->new(-file => ">orf2.fa", -format => "fasta");
my $seqout3 = Bio::SeqIO->new(-file => ">orf3.fa", -format => "fasta");
my $seqout4 = Bio::SeqIO->new(-file => ">orf4.fa", -format => "fasta");
my $seqout5 = Bio::SeqIO->new(-file => ">orf5.fa", -format => "fasta");
my $seqout6 = Bio::SeqIO->new(-file => ">orf6.fa", -format => "fasta");

$seqout1->write_seq($seqs[0]);
$seqout2->write_seq($seqs[1]);
$seqout3->write_seq($seqs[2]);
$seqout4->write_seq($seqs[3]);
$seqout5->write_seq($seqs[4]);
$seqout6->write_seq($seqs[5]);