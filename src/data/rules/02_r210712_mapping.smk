
####
##

rule map210712:
    input:
        pj="../../../pneumocystis_comparative_genomics/data/raw/Pjir/GCF_001477535.1_Pneu_jiro_RU7_V2_genomic.fna",
        pmac="../../../pneumocystis_comparative_genomics/data/processed/Pmac/Funannotate/PMAC_NAID_v2/predict_results/Pneumocystis_macacae_NIAID.scaffolds.fa",
        pc="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_genomic.fna",
#        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/GCF_000349005.2_Pneumo_murina_B123_V4_genomic.fna",
        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_genomic.fasta",
        s1r1="../../data/processed/host_removed/210712/S1.1.fq.gz",
        s1r2="../../data/processed/host_removed/210712/S1.2.fq.gz",
        s2r1="../../data/processed/host_removed/210712/S2.1.fq.gz",
        s2r2="../../data/processed/host_removed/210712/S2.2.fq.gz",
        s3r1="../../data/processed/host_removed/210712/S3.1.fq.gz",
        s3r2="../../data/processed/host_removed/210712/S3.2.fq.gz",
        s4r1="../../data/processed/host_removed/210712/S4.1.fq.gz",
        s4r2="../../data/processed/host_removed/210712/S4.2.fq.gz",
        s5r1="../../data/processed/host_removed/210712/S5.1.fq.gz",
        s5r2="../../data/processed/host_removed/210712/S5.2.fq.gz",
        s6r1="../../data/processed/host_removed/210712/S6.1.fq.gz",
        s6r2="../../data/processed/host_removed/210712/S6.2.fq.gz",
        s7r1="../../data/processed/host_removed/210712/S7.1.fq.gz",
        s7r2="../../data/processed/host_removed/210712/S7.2.fq.gz",
        s8r1="../../data/processed/host_removed/210712/S8.1.fq.gz",
        s8r2="../../data/processed/host_removed/210712/S8.2.fq.gz",
        s9r1="../../data/processed/host_removed/210712/S9.1.fq.gz",
        s9r2="../../data/processed/host_removed/210712/S9.2.fq.gz",
        
 
    threads:  12

#    conda:
#        "envs/meta.yaml"

    output:
        s1=temp("../../data/processed/mapping/210712/S1.bam"),
        s2=temp("../../data/processed/mapping/210712/S2.bam"),
        s3=temp("../../data/processed/mapping/210712/S3.bam"),
        s4=temp("../../data/processed/mapping/210712/S4.bam"),
        s5=temp("../../data/processed/mapping/210712/S5.bam"),
        s6=temp("../../data/processed/mapping/210712/S6.bam"),
        s7=temp("../../data/processed/mapping/210712/S7.bam"),
        s8=temp("../../data/processed/mapping/210712/S8.bam"),
        s9=temp("../../data/processed/mapping/210712/S9.bam"),

    run:
        shell("bwa mem -M -t {threads} {input.pmac} {input.s1r1} {input.s1r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s1}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s2r1} {input.s2r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s2}")
        shell("bwa mem -M -t {threads} {input.pj} {input.s3r1} {input.s3r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s3}")
        shell("bwa mem -M -t {threads} {input.pj} {input.s4r1} {input.s4r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s4}")
        shell("bwa mem -M -t {threads} {input.pm} {input.s5r1} {input.s5r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s5}")
        shell("bwa mem -M -t {threads} {input.pm} {input.s6r1} {input.s6r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s6}")
        shell("bwa mem -M -t {threads} {input.pm} {input.s7r1} {input.s7r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s7}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s8r1} {input.s8r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s8}")
        shell("bwa mem -M -t {threads} {input.pc} {input.s9r1} {input.s9r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s9}")
        
rule mark_dup210712:
    input:
        s1=rules.map210712.output.s1,
        s2=rules.map210712.output.s2,
        s3=rules.map210712.output.s3,
        s4=rules.map210712.output.s4,
        s5=rules.map210712.output.s5,
        s6=rules.map210712.output.s6,
        s7=rules.map210712.output.s7,
        s8=rules.map210712.output.s8,
        s9=rules.map210712.output.s9,
    log:
        "../../data/processed/mapping/logs/picar_210712.log"
    output:
        s1=protected("../../data/processed/mapping/210712/S1_dr.bam"),
        s2=protected("../../data/processed/mapping/210712/S2_dr.bam"),
        s3=protected("../../data/processed/mapping/210712/S3_dr.bam"),
        s4=protected("../../data/processed/mapping/210712/S4_dr.bam"),
        s5=protected("../../data/processed/mapping/210712/S5_dr.bam"),
        s6=protected("../../data/processed/mapping/210712/S6_dr.bam"),
        s7=protected("../../data/processed/mapping/210712/S7_dr.bam"),
        s8=protected("../../data/processed/mapping/210712/S8_dr.bam"),
        s9=protected("../../data/processed/mapping/210712/S9_dr.bam"),

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
