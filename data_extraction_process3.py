
file=open("C:\\processed_multiple_demultiplex.bc1001--bc1049.Q20.fasta_HLA-result_C_final.out",mode='r',encoding='utf-8-sig')
f=open("C:\\1001-1049C.out",mode='w',encoding='utf-8-sig')
while True:
    line = file.readline()
    if not line:
        break

    if ("Score        E" in line) and ("99%" in line):
        f.write(line.strip())
        f.write("\n")


f.close()
file.close()