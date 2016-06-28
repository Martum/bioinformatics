#!/usr/bin/perl -w

use Bio::Tools::Run::StandAloneBlastPlus;

my $filename = $ARGV[0];

$fac = Bio::Tools::Run::StandAloneBlastPlus->new(
  -db_name => 'swissprot'
);

$seqio = Bio::SeqIO->new(-file => $filename, -format => "fasta" );

$result = $fac->blastp( -query => $seqio, -outfile => 'blast.out');

print $result;
