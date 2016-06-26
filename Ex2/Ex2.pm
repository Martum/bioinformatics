#!/usr/bin/perl -w

use Bio::Tools::Run::StandAloneBlastPlus;

$fac = Bio::Tools::Run::StandAloneBlastPlus->new(
  -db_name => 'swissprot'
);

$seqio = Bio::SeqIO->new(-file => "orf2.fa", -format => "fasta" );

$result = $fac->blastp( -query => $seqio, -outfile => 'blast.out');

print $result;