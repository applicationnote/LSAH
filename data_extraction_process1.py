file = open('C:\\processed_multiple_demultiplex.bc1001--bc1049.Q20.fasta_HLA-result_A.out', mode='r', encoding='utf-8-sig')
f = open('C:\\processed_multiple_demultiplex.bc1001--bc1049.Q20.fasta_HLA-result_A_final.out', mode='w', encoding='utf-8-sig')
while True:
    line = file.readline()
    if not line:
        break
    if ">" in line:
        f.write(line.strip())
    if "Score" in line:
        f.write(line.strip())
    if "Identities" in line:
        f.write(line.strip())
        f.write("\n")

f.close()
file.close()
