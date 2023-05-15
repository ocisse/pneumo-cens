
####
##

rule map220606:
    input:
        pc="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_genomic.fna",
        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_genomic.fasta",
        s1r1="../../data/processed/host_removed/220606/S1.1.fq.gz",
        s1r2="../../data/processed/host_removed/220606/S1.2.fq.gz",
        s5r1="../../data/processed/host_removed/220606/S5.1.fq.gz",
        s5r2="../../data/processed/host_removed/220606/S5.2.fq.gz",
        s6r1="../../data/processed/host_removed/220606/S6.1.fq.gz",
        s6r2="../../data/processed/host_removed/220606/S6.2.fq.gz",
        s8r1="../../data/processed/host_removed/220606/S8.1.fq.gz",
        s8r2="../../data/processed/host_removed/220606/S8.2.fq.gz",

    threads:  12

#    conda:
#        "envs/meta.yaml"

    output:
        s1="../../data/processed/mapping/220606/S1.bam",
        s5="../../data/processed/mapping/220606/S5.bam",
        s6="../../data/processed/mapping/220606/S6.bam",
        s8="../../data/processed/mapping/220606/S8.bam",
    run:
        shell("bwa mem -M -t {threads} {input.pm} {input.s1r1} {input.s1r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s1}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s5r1} {input.s5r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s5}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s6r1} {input.s6r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s6}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s8r1} {input.s8r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s8}")

rule mark_dup220606:
    input:
        s1=rules.map220606.output.s1,
        s5=rules.map220606.output.s5,
        s6=rules.map220606.output.s6,
        s8=rules.map220606.output.s8,
    log:
        "../../data/processed/mapping/logs/picar_220606.log"
    output:
        s1=protected("../../data/processed/mapping/220606/S1_dr.bam"),
        s5=protected("../../data/processed/mapping/220606/S5_dr.bam"),
        s6=protected("../../data/processed/mapping/220606/S6_dr.bam"),
        s8=protected("../../data/processed/mapping/220606/S8_dr.bam"),

    run:
        shell("picard MarkDuplicates I={input.s1}  O={output.s1} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s5}  O={output.s5} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s6}  O={output.s6} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s8}  O={output.s8} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")

rule coverage_220606:
    input:
        s1=rules.mark_dup220606.output.s1,
        s5=rules.mark_dup220606.output.s5,
        s6=rules.mark_dup220606.output.s6,
        s8=rules.mark_dup220606.output.s8,
    params:
        b="50", norm="BPM",  pmgs="7451359", pcgs="7661456", f="bigwig"
    output:
        s1="../../data/processed/mapping/220606/S1_dr.bw",
        s5="../../data/processed/mapping/220606/S5_dr.bw",
        s6="../../data/processed/mapping/220606/S6_dr.bw",
        s8="../../data/processed/mapping/220606/S8_dr.bw",
    run:
        shell("bamCoverage -p {threads} -b {input.s1} -o {output.s1} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s5} -o {output.s5} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s6} -o {output.s6} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s8} -o {output.s8} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
