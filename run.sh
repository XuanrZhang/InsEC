#!/bin/bash
echo "given sequence: $1"
echo "given read dataset: $2"
echo "the length of the given sequence: $3"
echo "the length of the read: $4"
echo "start read extraction"

#--- build index----
./bwa-mem2 index $1 

#--- map by BWA-MEM ---
./bwa-mem2 mem -T 90 $1 $2 > gene.sam;
awk 'BEGIN{tmp="'"${4}M"'"}{if(NR>2 && $6==tmp) print $1" "$2 " "$4 " "$10}' gene.sam |sort -nk3 > extract.sam;

#--- run correction----
a="--gene_L=${3}";
b="--read_L=${4}";
echo "python error_cor.py $a $b";
python error_cor.py $a $b;
