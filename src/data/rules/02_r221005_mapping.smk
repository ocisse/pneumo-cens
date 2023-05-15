
####
##
rule map221005:
    input:
        pc="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_genomic.fna",
        s1r1="../../data/processed/host_removed/221005/S1.1.fq.gz",
        s1r2="../../data/processed/host_removed/221005/S1.2.fq.gz",
        s2r1="../../data/processed/host_removed/221005/S2.1.fq.gz",
        s2r2="../../data/processed/host_removed/221005/S2.2.fq.gz",
        s3r1="../../data/processed/host_removed/221005/S3.1.fq.gz",
        s3r2="../../data/processed/host_removed/221005/S3.2.fq.gz",
        s4r1="../../data/processed/host_removed/221005/S4.1.fq.gz",
        s4r2="../../data/processed/host_removed/221005/S4.2.fq.gz",

    threads:  12

#    conda:
#        "envs/meta.yaml"

    output:
        s1=temp("../../data/processed/mapping/221005/S1.bam"),
        s2=temp("../../data/processed/mapping/221005/S2.bam"),
        s3=temp("../../data/processed/mapping/221005/S3.bam"),
        s4=temp("../../data/processed/mapping/221005/S4.bam"),
    run:
        shell("bwa mem -M -t {threads} {input.pc} {input.s1r1} {input.s1r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s1}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s2r1} {input.s2r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s2}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s3r1} {input.s3r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s3}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s4r1} {input.s4r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s4}")

rule mark_dup221005:
    input:
        s1=rules.map221005.output.s1,
        s2=rules.map221005.output.s2,
        s3=rules.map221005.output.s3,
        s4=rules.map221005.output.s4,
    log:
        "../../data/processed/mapping/logs/picar_221005.log"
    output:
        s1=protected("../../data/processed/mapping/221005/S1_dr.bam"),
        s2=protected("../../data/processed/mapping/221005/S2_dr.bam"),
        s3=protected("../../data/processed/mapping/221005/S3_dr.bam"),
        s4=protected("../../data/processed/mapping/221005/S4_dr.bam"),

    run:
        shell("picard MarkDuplicates I={input.s1}  O={output.s1} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s2}  O={output.s2} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s3}  O={output.s3} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s4}  O={output.s4} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")

rule coverage_221005:
    input:
        s1=rules.mark_dup221005.output.s1,
        s2=rules.mark_dup221005.output.s2,
        s3=rules.mark_dup221005.output.s3,
        s4=rules.mark_dup221005.output.s4,
    params:
        b="50", norm="BPM",  pcgs="7661456", f="bigwig"
    output:
        s1=protected("../../data/processed/mapping/221005/S1_dr.bw"),
        s2=protected("../../data/processed/mapping/221005/S2_dr.bw"),
        s3=protected("../../data/processed/mapping/221005/S3_dr.bw"),
        s4=protected("../../data/processed/mapping/221005/S4_dr.bw"),
    run:
        shell("bamCoverage -p {threads} -b {input.s1} -o {output.s1} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads") 
        shell("bamCoverage -p {threads} -b {input.s2} -o {output.s2} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s3} -o {output.s3} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s4} -o {output.s4} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
