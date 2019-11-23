#!/bin/bash

#--- install BWA-MEM ---
git clone https://github.com/bwa-mem2/bwa-mem2
cd bwa-mem2
make
cd ..

#--- build index----
bwa-mem2/bwa-mem2 index ref.fa 

#--- map by BWA-MEM ---
bwa-mem2/bwa-mem2 mem -T 90 ref.fa reads.fq > gene.sam;
awk '{if(NR>2 && $6=="100M") print $1" "$2 " "$4 " "$10}' gene.sam |sort -nk3 > extract.sam;

#--- run correction----
a="--start_poi=${start_poi}";
b="--end_poi=${end_poi}";
c="--sam_file=extract.sam"; 
d="--write_file=corrected.fa"; 
e="--write_file_2in=corrected_2in.txt";
f="--write_file_seq=contigs.fa";
python error_cor.py $a $b $c $d $e $f;

