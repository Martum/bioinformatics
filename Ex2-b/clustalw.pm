#!/usr/bin/perl -w

use Bio::Tools::Run::Alignment::Clustalw;

#  Build a clustalw alignment factory
@params = ('ktuple' => 2, 'matrix' => 'BLOSUM');
$factory = Bio::Tools::Run::Alignment::Clustalw->new(@params);

#  Pass the factory a list of sequences to be aligned.        
$inputfilename = 'seqdump.txt';

$str = Bio::SeqIO->new(-file=> $inputfilename, -format => 'Fasta');
@seq_array =();
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$seq_array_ref = \@seq_array;

# Get both an alignment and a tree
($aln, $tree) = $factory->run(\@seq_array);