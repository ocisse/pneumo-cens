
####
##

rule map210927:
    input:
        pc="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_genomic.fna",
        s1r1="../../data/processed/host_removed/210927/S1.1.fq.gz",
        s1r2="../../data/processed/host_removed/210927/S1.2.fq.gz",
        s2r1="../../data/processed/host_removed/210927/S2.1.fq.gz",
        s2r2="../../data/processed/host_removed/210927/S2.2.fq.gz",
        s3r1="../../data/processed/host_removed/210927/S3.1.fq.gz",
        s3r2="../../data/processed/host_removed/210927/S3.2.fq.gz",
        s4r1="../../data/processed/host_removed/210927/S4.1.fq.gz",
        s4r2="../../data/processed/host_removed/210927/S4.2.fq.gz",
        s5r1="../../data/processed/host_removed/210927/S5.1.fq.gz",
        s5r2="../../data/processed/host_removed/210927/S5.2.fq.gz",
        s6r1="../../data/processed/host_removed/210927/S6.1.fq.gz",
        s6r2="../../data/processed/host_removed/210927/S6.2.fq.gz",
        s7r1="../../data/processed/host_removed/210927/S7.1.fq.gz",
        s7r2="../../data/processed/host_removed/210927/S7.2.fq.gz",
        s8r1="../../data/processed/host_removed/210927/S8.1.fq.gz",
        s8r2="../../data/processed/host_removed/210927/S8.2.fq.gz",
        s9r1="../../data/processed/host_removed/210927/S9.1.fq.gz",
        s9r2="../../data/processed/host_removed/210927/S9.2.fq.gz",
        s10r1="../../data/processed/host_removed/210927/S10.1.fq.gz", 
        s10r2="../../data/processed/host_removed/210927/S10.2.fq.gz",
        s11r1="../../data/processed/host_removed/210927/S11.1.fq.gz",
        s11r2="../../data/processed/host_removed/210927/S11.2.fq.gz",
        s12r1="../../data/processed/host_removed/210927/S12.1.fq.gz",
        s12r2="../../data/processed/host_removed/210927/S12.2.fq.gz",

    threads:  12

#    conda:
#        "envs/meta.yaml"

    output:
        s1=temp("../../data/processed/mapping/210927/S1.bam"),
        s2=temp("../../data/processed/mapping/210927/S2.bam"),
        s3=temp("../../data/processed/mapping/210927/S3.bam"),
        s4=temp("../../data/processed/mapping/210927/S4.bam"),
        s5=temp("../../data/processed/mapping/210927/S5.bam"),
        s6=temp("../../data/processed/mapping/210927/S6.bam"),
        s7=temp("../../data/processed/mapping/210927/S7.bam"),
        s8=temp("../../data/processed/mapping/210927/S8.bam"),
        s9=temp("../../data/processed/mapping/210927/S9.bam"),
        s10=temp("../../data/processed/mapping/210927/S10.bam"),
        s11=temp("../../data/processed/mapping/210927/S11.bam"),
        s12=temp("../../data/processed/mapping/210927/S12.bam"),
    run:
        shell("bwa mem -M -t {threads} {input.pc} {input.s1r1} {input.s1r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s1}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s2r1} {input.s2r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s2}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s3r1} {input.s3r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s3}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s4r1} {input.s4r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s4}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s5r1} {input.s5r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s5}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s6r1} {input.s6r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s6}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s7r1} {input.s7r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s7}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s8r1} {input.s8r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s8}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s9r1} {input.s9r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s9}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s10r1} {input.s10r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s10}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s11r1} {input.s11r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s11}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s12r1} {input.s12r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s12}") 

rule mark_dup210927:
    input:
        s1=rules.map210927.output.s1,
        s2=rules.map210927.output.s2,
        s3=rules.map210927.output.s3,
        s4=rules.map210927.output.s4,
        s5=rules.map210927.output.s5,
        s6=rules.map210927.output.s6,
        s7=rules.map210927.output.s7,
        s8=rules.map210927.output.s8,
        s9=rules.map210927.output.s9,
        s10=rules.map210927.output.s10,
        s11=rules.map210927.output.s11,
        s12=rules.map210927.output.s12
    log:
        "../../data/processed/mapping/logs/picar_210927.log"
    output:
        s1=protected("../../data/processed/mapping/210927/S1_dr.bam"),
        s2=protected("../../data/processed/mapping/210927/S2_dr.bam"),
        s3=protected("../../data/processed/mapping/210927/S3_dr.bam"),
        s4=protected("../../data/processed/mapping/210927/S4_dr.bam"),
        s5=protected("../../data/processed/mapping/210927/S5_dr.bam"),
        s6=protected("../../data/processed/mapping/210927/S6_dr.bam"),
        s7=protected("../../data/processed/mapping/210927/S7_dr.bam"),
        s8=protected("../../data/processed/mapping/210927/S8_dr.bam"),
        s9=protected("../../data/processed/mapping/210927/S9_dr.bam"),
        s10=protected("../../data/processed/mapping/210927/S10_dr.bam"),
        s11=protected("../../data/processed/mapping/210927/S11_dr.bam"),
        s12=protected("../../data/processed/mapping/210927/S12_dr.bam"),

    run:
        shell("picard MarkDuplicates I={input.s1}  O={output.s1} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s2}  O={output.s2} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s3}  O={output.s3} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s4}  O={output.s4} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s5}  O={output.s5} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s6}  O={output.s6} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s7}  O={output.s7} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s8}  O={output.s8} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s9}  O={output.s9} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s10}  O={output.s10} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s11}  O={output.s11} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s12}  O={output.s12} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")

rule coverage_210927:
    input:
        s1=rules.mark_dup210927.output.s1,
        s2=rules.mark_dup210927.output.s2,
        s3=rules.mark_dup210927.output.s3,
        s4=rules.mark_dup210927.output.s4,
        s5=rules.mark_dup210927.output.s5,
        s6=rules.mark_dup210927.output.s6,
        s7=rules.mark_dup210927.output.s7,
        s8=rules.mark_dup210927.output.s8,
        
    params:
        b="50", norm="BPM",  pmgs="7451359", pcgs="7661456", f="bigwig"
    output:
        s1="../../data/processed/mapping/210927/S1_dr.bw",
        s2="../../data/processed/mapping/210927/S2_dr.bw",
        s3="../../data/processed/mapping/210927/S3_dr.bw",
        s4="../../data/processed/mapping/210927/S4_dr.bw",
        s5="../../data/processed/mapping/210927/S5_dr.bw",
        s6="../../data/processed/mapping/210927/S6_dr.bw",
        s7="../../data/processed/mapping/210927/S7_dr.bw",
        s8="../../data/processed/mapping/210927/S8_dr.bw",
    threads: 6 
    run:
        shell("bamCoverage -p {threads} -b {input.s1} -o {output.s1} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s2} -o {output.s2} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s3} -o {output.s3} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s4} -o {output.s4} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s5} -o {output.s5} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s6} -o {output.s6} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s7} -o {output.s7} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s8} -o {output.s8} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
