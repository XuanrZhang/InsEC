# InsEC
InsEC is an instance-based error correction tool which is capable of rectifying errors with very high accuracy for the reads of disease-causing genes.
The key idea is to exploit local sequence features related to the instance reads so as to achieve better error correction than the global approaches. 

The method has two main steps.
The extraction step collects those reads relevant to a given gene from a WGS dataset through a noise-tolerant mapping technique.
In the correction step, we take advantage of alignment processes and rectify errors according to the exhaustive alignment patterns and statistics.

## Dependancies
BWA-MEM tool is used in extraction step. Here is the instruction of BWA-MEM installation (https://github.com/bwa-mem2/bwa-mem2).

It requires python3.

  
## Notice
Input: A read dataset in .fasta\fastq format and an nucleotide sequence of interests in .fasta format

	- reads.fa(\fq) : store the whole read data needed to be corrected.

Output: A corrected read dataset only related to the given nucleotide sequence and An assembled contig based on corrected data

	- corrected.fa :store corrected read data.
	- contigs.fa :store the updated nucleotide sequence of the gene (or the genome region of interests).

## Download & Usage

	git clone https://github.com/xuanrzhang/InsEC
	cd InsEC
	run.sh reads.fq ref.fa 
	

## Citation
Please cite the work "Instance-based error correction for short reads of disease genes."

## Citation
If any bugs during your running, please email to xzhangxmu@gmail.com
