#1. Making HLA-A, HLA-B, HLA-C, HLA-DR, HLA-DP, HLA-DQ Database using reference fasta file

dustmasker -in HLA-A_gen.fasta -infmt fasta -parse_seqids -outfmt maskinfo_asn1_bin -out HLA-A_gene_dust.asnb


#2. Delete PCR primer sequences in sequencing fasta files

perl in_silico_PCR.pl -s ./demultiplex.bc1001--bc1049.Q20.fasta -p Primersequence.txt -l 4970 -e > demultiplex.bc1001--bc1049.Q20.txt 2> multiple_demultiplex.bc1001--bc1049.Q20.fasta


#3. remove useless text in the output data

sed '/Use of uninitialized value/d' multiple_demultiplex.bc1001--bc1049.Q20.fasta > processed_multiple_demultiplex.bc1001--bc1049.Q20.fasta

#4. running blastn program for alignment

blastn -db HLA-A_gen_ref -query processed_multiple_demultiplex.bc1001--bc1049.Q20.fasta -out processed_multiple_demultiplex.bc1001--bc1049.Q20.fasta_HLA-result_A.out


#5. changing command for HLA 4 digit to 2 digit.

#1) HLA 4 digit to 3 digit

sed -i "s/([0-9]):([0-9]):([0-9]):([0-9])/\1:\2/g" processed_multiple_demultiplex.bc1001--bc1049.Q20.fasta_HLA-result_A_final.out


#2) HLA 3 digit to 2 digit

sed -i "s/([0-9]):([0-9]):([0-9]*)/\1:\2/g" processed_multiple_demultiplex.bc1001?bc1049.Q20.fasta_HLA-result_A_final.out

# 6. Running python script for extraction of Score, Identities and gap values from BLASTN alignment result files.Users can modify file input information to HLA-A, HLA-B, HLA-C, HLA-DR, HLA-DP, HLA-DQ

# data_extraction_process1.py is data extraction code for Score and Identity information from BLASTN alignment output

# data_extraction_process2.py is data extraction code for Identity = 100%

# data_extraction_process3.py is data extraction code for Identity = 99%

# 7. Running R script for calculating frequency and HLA typing

#example R command:

# > result<-read.csv("processed_output.csv")

# > Freq(result$HLA)
