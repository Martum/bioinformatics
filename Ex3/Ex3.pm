#!/usr/bin/perl -w

use strict;
use warnings;    
use Bio::SearchIO;

my $filter = $ARGV[0];
my $inputfilename = $ARGV[1];

my $report_obj = new Bio::SearchIO(-format => 'blast', -file   => $inputfilename);

my $filename = 'Ex3-output.txt';

open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

while (my $result = $report_obj -> next_result) {
  while (my $hit = $result -> next_hit) {

    my $count = () = $hit -> description =~ /$filter/g;

    if ($count > 0) {
      print $fh $hit -> name, "|", $hit -> description, "\n";
    } 

  }
}

close $fh;
