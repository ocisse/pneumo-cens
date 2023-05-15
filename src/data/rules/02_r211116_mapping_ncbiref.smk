
####
##

rule map211116_rep:
    input:
#        pmac="../../../pneumocystis_comparative_genomics/data/processed/Pmac/Funannotate/PMAC_NAID_v2/predict_results/Pneumocystis_macacae_NIAID.scaffolds.fa",
        pmac="/hpcdata/dcr_cc/Ousmane_Data/projects/pneumocystis_comparative_genomics/data/processed/Pmac/P2C_ncbi/ncbi_dataset/data/GCA_018127085.1/GCA_018127085.1_P2C.v1.0_genomic.fna",
        s2r1="../../data/processed/host_removed/211116/S2.1.fq.gz",
        s2r2="../../data/processed/host_removed/211116/S2.2.fq.gz",
        s3r1="../../data/processed/host_removed/211116/S3.1.fq.gz",
        s3r2="../../data/processed/host_removed/211116/S3.2.fq.gz",
        s4r1="../../data/processed/host_removed/211116/S4.1.fq.gz",
        s4r2="../../data/processed/host_removed/211116/S4.2.fq.gz",
        s5r1="../../data/processed/host_removed/211116/S5.1.fq.gz",
        s5r2="../../data/processed/host_removed/211116/S5.2.fq.gz",
        s6r1="../../data/processed/host_removed/211116/S6.1.fq.gz",
        s6r2="../../data/processed/host_removed/211116/S6.2.fq.gz",
        s7r1="../../data/processed/host_removed/211116/S7.1.fq.gz",
        s7r2="../../data/processed/host_removed/211116/S7.2.fq.gz",
        s8r1="../../data/processed/host_removed/211116/S8.1.fq.gz",
        s8r2="../../data/processed/host_removed/211116/S8.2.fq.gz",

    threads:  12

#    conda:
#        "envs/meta.yaml"

    output:
        s2=temp("../../data/processed/mapping/211116_rep/S2.bam"),
        s3=temp("../../data/processed/mapping/211116_rep/S3.bam"),
        s4=temp("../../data/processed/mapping/211116_rep/S4.bam"),
        s5=temp("../../data/processed/mapping/211116_rep/S5.bam"),
        s6=temp("../../data/processed/mapping/211116_rep/S6.bam"),
        s7=temp("../../data/processed/mapping/211116_rep/S7.bam"),
        s8=temp("../../data/processed/mapping/211116_rep/S8.bam"),
    run:
        shell("bwa mem -M -t {threads} {input.pmac} {input.s2r1} {input.s2r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s2}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s3r1} {input.s3r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s3}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s4r1} {input.s4r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s4}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s5r1} {input.s5r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s5}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s6r1} {input.s6r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s6}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s7r1} {input.s7r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s7}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s8r1} {input.s8r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s8}")

rule mark_dup211116_rep:
    input:
        s2=rules.map211116_rep.output.s2,
        s3=rules.map211116_rep.output.s3,
        s4=rules.map211116_rep.output.s4,
        s5=rules.map211116_rep.output.s5,
        s6=rules.map211116_rep.output.s6,
        s7=rules.map211116_rep.output.s7,
        s8=rules.map211116_rep.output.s8,
    log:
        "../../data/processed/mapping/logs/picar_211116.log"
    output:
        s2=protected("../../data/processed/mapping/211116_rep/S2_dr.bam"),
        s3=protected("../../data/processed/mapping/211116_rep/S3_dr.bam"),
        s4=protected("../../data/processed/mapping/211116_rep/S4_dr.bam"),
        s5=protected("../../data/processed/mapping/211116_rep/S5_dr.bam"),
        s6=protected("../../data/processed/mapping/211116_rep/S6_dr.bam"),
        s7=protected("../../data/processed/mapping/211116_rep/S7_dr.bam"),
        s8=protected("../../data/processed/mapping/211116_rep/S8_dr.bam"),

    run:
        shell("picard MarkDuplicates I={input.s2}  O={output.s2} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s3}  O={output.s3} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s4}  O={output.s4} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s5}  O={output.s5} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s6}  O={output.s6} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s7}  O={output.s7} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s8}  O={output.s8} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")

rule coverage_211116:
    input:
        s2=rules.mark_dup211116_rep.output.s2,
        s3=rules.mark_dup211116_rep.output.s3,
        s4=rules.mark_dup211116_rep.output.s4,
        s5=rules.mark_dup211116_rep.output.s5,
        s6=rules.mark_dup211116_rep.output.s6,
        s7=rules.mark_dup211116_rep.output.s7,
        s8=rules.mark_dup211116_rep.output.s8,
        
    params:
        b="50", norm="BPM",  pmgs="7451359", pcgs="7661456", pmacgs="8274841", f="bigwig"
    output:
        s2="../../data/processed/mapping/211116_rep/S2_dr.bw",
        s3="../../data/processed/mapping/211116_rep/S3_dr.bw",
        s4="../../data/processed/mapping/211116_rep/S4_dr.bw",
        s5="../../data/processed/mapping/211116_rep/S5_dr.bw",
        s6="../../data/processed/mapping/211116_rep/S6_dr.bw",
        s7="../../data/processed/mapping/211116_rep/S7_dr.bw",
        s8="../../data/processed/mapping/211116_rep/S8_dr.bw",
        
    threads: 6
    run:
        shell("samtools index -b {input.s2}")
        shell("samtools index -b {input.s3}")
        shell("samtools index -b {input.s4}")
        shell("samtools index -b {input.s5}")
        shell("samtools index -b {input.s6}")
        shell("samtools index -b {input.s7}")
        shell("samtools index -b {input.s8}")
        shell("bamCoverage -p {threads} -b {input.s2} -o {output.s2} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s3} -o {output.s3} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s4} -o {output.s4} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s5} -o {output.s5} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s6} -o {output.s6} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s7} -o {output.s7} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s8} -o {output.s8} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} -of {params.f} --centerReads")

