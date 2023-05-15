
####
##

rule map211220:
    input:
        pj="../../../pneumocystis_comparative_genomics/data/raw/Pjir/GCF_001477535.1_Pneu_jiro_RU7_V2_genomic.fna",
        pmac="../../../pneumocystis_comparative_genomics/data/processed/Pmac/Funannotate/PMAC_NAID_v2/predict_results/Pneumocystis_macacae_NIAID.scaffolds.fa",
        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_genomic.fasta",
        s1r1="../../data/processed/host_removed/211220/S1.1.fq.gz",s1r2="../../data/processed/host_removed/211220/S1.2.fq.gz",
        s2r1="../../data/processed/host_removed/211220/S2.1.fq.gz",s2r2="../../data/processed/host_removed/211220/S2.2.fq.gz",
        s3r1="../../data/processed/host_removed/211220/S3.1.fq.gz",s3r2="../../data/processed/host_removed/211220/S3.2.fq.gz",
        s4r1="../../data/processed/host_removed/211220/S4.1.fq.gz",s4r2="../../data/processed/host_removed/211220/S4.2.fq.gz",
        s5r1="../../data/processed/host_removed/211220/S5.1.fq.gz",s5r2="../../data/processed/host_removed/211220/S5.2.fq.gz",
        s6r1="../../data/processed/host_removed/211220/S6.1.fq.gz",s6r2="../../data/processed/host_removed/211220/S6.2.fq.gz",
        s7r1="../../data/processed/host_removed/211220/S7.1.fq.gz",s7r2="../../data/processed/host_removed/211220/S7.2.fq.gz",
        s8r1="../../data/processed/host_removed/211220/S8.1.fq.gz",s8r2="../../data/processed/host_removed/211220/S8.2.fq.gz",
        s9r1="../../data/processed/host_removed/211220/S9.1.fq.gz",s9r2="../../data/processed/host_removed/211220/S9.2.fq.gz",
        s10r1="../../data/processed/host_removed/211220/S10.1.fq.gz", s10r2="../../data/processed/host_removed/211220/S10.2.fq.gz",
        s11r1="../../data/processed/host_removed/211220/S11.1.fq.gz",s11r2="../../data/processed/host_removed/211220/S11.2.fq.gz",
        s12r1="../../data/processed/host_removed/211220/S12.1.fq.gz",s12r2="../../data/processed/host_removed/211220/S12.2.fq.gz",
        s13r1="../../data/processed/host_removed/211220/S13.1.fq.gz",s13r2="../../data/processed/host_removed/211220/S13.2.fq.gz",
        s14r1="../../data/processed/host_removed/211220/S14.1.fq.gz",s14r2="../../data/processed/host_removed/211220/S14.2.fq.gz",
        s15r1="../../data/processed/host_removed/211220/S15.1.fq.gz",s15r2="../../data/processed/host_removed/211220/S15.2.fq.gz",
        s16r1="../../data/processed/host_removed/211220/S16.1.fq.gz",s16r2="../../data/processed/host_removed/211220/S16.2.fq.gz",
        s17r1="../../data/processed/host_removed/211220/S17.1.fq.gz",s17r2="../../data/processed/host_removed/211220/S17.2.fq.gz",
        s18r1="../../data/processed/host_removed/211220/S18.1.fq.gz",s18r2="../../data/processed/host_removed/211220/S18.2.fq.gz",
        s19r1="../../data/processed/host_removed/211220/S19.1.fq.gz",s19r2="../../data/processed/host_removed/211220/S19.2.fq.gz",
        s20r1="../../data/processed/host_removed/211220/S20.1.fq.gz",s20r2="../../data/processed/host_removed/211220/S20.2.fq.gz",
        s21r1="../../data/processed/host_removed/211220/S21.1.fq.gz",s21r2="../../data/processed/host_removed/211220/S21.2.fq.gz",
        s22r1="../../data/processed/host_removed/211220/S22.1.fq.gz",s22r2="../../data/processed/host_removed/211220/S22.2.fq.gz",
        s23r1="../../data/processed/host_removed/211220/S23.1.fq.gz",s23r2="../../data/processed/host_removed/211220/S23.2.fq.gz",
        s24r1="../../data/processed/host_removed/211220/S24.1.fq.gz",s24r2="../../data/processed/host_removed/211220/S24.2.fq.gz",

    threads:  12

#    conda:
#        "envs/meta.yaml"

    output:
        s1=temp("../../data/processed/mapping/211220/S1.bam"),
        s2=temp("../../data/processed/mapping/211220/S2.bam"),
        s3=temp("../../data/processed/mapping/211220/S3.bam"),
        s4=temp("../../data/processed/mapping/211220/S4.bam"),
        s5=temp("../../data/processed/mapping/211220/S5.bam"),
        s6=temp("../../data/processed/mapping/211220/S6.bam"),
        s7=temp("../../data/processed/mapping/211220/S7.bam"),
        s8=temp("../../data/processed/mapping/211220/S8.bam"),
        s9=temp("../../data/processed/mapping/211220/S9.bam"),
        s10=temp("../../data/processed/mapping/211220/S10.bam"),
        s11=temp("../../data/processed/mapping/211220/S11.bam"),
        s12=temp("../../data/processed/mapping/211220/S12.bam"),
        s13=temp("../../data/processed/mapping/211220/S13.bam"),
        s14=temp("../../data/processed/mapping/211220/S14.bam"),
        s15=temp("../../data/processed/mapping/211220/S15.bam"),
        s16=temp("../../data/processed/mapping/211220/S16.bam"),
        s17=temp("../../data/processed/mapping/211220/S17.bam"),
        s18=temp("../../data/processed/mapping/211220/S18.bam"),
        s19=temp("../../data/processed/mapping/211220/S19.bam"),
        s20=temp("../../data/processed/mapping/211220/S20.bam"),
        s21=temp("../../data/processed/mapping/211220/S21.bam"),
        s22=temp("../../data/processed/mapping/211220/S22.bam"),
        s23=temp("../../data/processed/mapping/211220/S23.bam"),
        s24=temp("../../data/processed/mapping/211220/S24.bam"),

    run:
        shell("bwa mem -M -t {threads} {input.pmac} {input.s1r1} {input.s1r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s1}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s2r1} {input.s2r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s2}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s3r1} {input.s3r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s3}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s4r1} {input.s4r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s4}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s5r1} {input.s5r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s5}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s6r1} {input.s6r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s6}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s7r1} {input.s7r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s7}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s8r1} {input.s8r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s8}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s9r1} {input.s9r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s9}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s10r1} {input.s10r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s10}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s11r1} {input.s11r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s11}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.s12r1} {input.s12r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s12}") 
        shell("bwa mem -M -t {threads} {input.pj} {input.s13r1} {input.s13r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s13}")
        shell("bwa mem -M -t {threads} {input.pj} {input.s14r1} {input.s14r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s14}")
        shell("bwa mem -M -t {threads} {input.pj} {input.s15r1} {input.s15r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s15}")
        shell("bwa mem -M -t {threads} {input.pj} {input.s16r1} {input.s16r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s16}")
        shell("bwa mem -M -t {threads} {input.pj} {input.s17r1} {input.s17r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s17}")
        shell("bwa mem -M -t {threads} {input.pj} {input.s18r1} {input.s18r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s18}")
        shell("bwa mem -M -t {threads} {input.pm} {input.s19r1} {input.s19r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s19}")
        shell("bwa mem -M -t {threads} {input.pm} {input.s20r1} {input.s20r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s20}")
        shell("bwa mem -M -t {threads} {input.pm} {input.s21r1} {input.s21r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s21}")
        shell("bwa mem -M -t {threads} {input.pm} {input.s22r1} {input.s22r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s22}")
        shell("bwa mem -M -t {threads} {input.pm} {input.s23r1} {input.s23r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s23}")
        shell("bwa mem -M -t {threads} {input.pm} {input.s24r1} {input.s24r2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.s24}")

rule mark_dup211220:
    input:
        s1=rules.map211220.output.s1,
        s2=rules.map211220.output.s2,
        s3=rules.map211220.output.s3,
        s4=rules.map211220.output.s4,
        s5=rules.map211220.output.s5,
        s6=rules.map211220.output.s6,
        s7=rules.map211220.output.s7,
        s8=rules.map211220.output.s8,
        s9=rules.map211220.output.s9,
        s10=rules.map211220.output.s10,
        s11=rules.map211220.output.s11,
        s12=rules.map211220.output.s12, 
        s13=rules.map211220.output.s13,
        s14=rules.map211220.output.s14,
        s15=rules.map211220.output.s15,
        s16=rules.map211220.output.s16,
        s17=rules.map211220.output.s17,
        s18=rules.map211220.output.s18,
        s19=rules.map211220.output.s19,
        s20=rules.map211220.output.s20,
        s21=rules.map211220.output.s21,
        s22=rules.map211220.output.s22,
        s23=rules.map211220.output.s23,
        s24=rules.map211220.output.s24,

    log:
        "../../data/processed/mapping/logs/picar_211220.log"
    output:
        s1=protected("../../data/processed/mapping/211220/S1_dr.bam"),
        s2=protected("../../data/processed/mapping/211220/S2_dr.bam"),
        s3=protected("../../data/processed/mapping/211220/S3_dr.bam"),
        s4=protected("../../data/processed/mapping/211220/S4_dr.bam"),
        s5=protected("../../data/processed/mapping/211220/S5_dr.bam"),
        s6=protected("../../data/processed/mapping/211220/S6_dr.bam"),
        s7=protected("../../data/processed/mapping/211220/S7_dr.bam"),
        s8=protected("../../data/processed/mapping/211220/S8_dr.bam"),
        s9=protected("../../data/processed/mapping/211220/S9_dr.bam"),
        s10=protected("../../data/processed/mapping/211220/S10_dr.bam"),
        s11=protected("../../data/processed/mapping/211220/S11_dr.bam"),
        s12=protected("../../data/processed/mapping/211220/S12_dr.bam"),
        s13=protected("../../data/processed/mapping/211220/S13_dr.bam"),
        s14=protected("../../data/processed/mapping/211220/S14_dr.bam"),
        s15=protected("../../data/processed/mapping/211220/S15_dr.bam"),
        s16=protected("../../data/processed/mapping/211220/S16_dr.bam"),
        s17=protected("../../data/processed/mapping/211220/S17_dr.bam"),
        s18=protected("../../data/processed/mapping/211220/S18_dr.bam"),
        s19=protected("../../data/processed/mapping/211220/S19_dr.bam"),
        s20=protected("../../data/processed/mapping/211220/S20_dr.bam"),
        s21=protected("../../data/processed/mapping/211220/S21_dr.bam"),
        s22=protected("../../data/processed/mapping/211220/S22_dr.bam"),
        s23=protected("../../data/processed/mapping/211220/S23_dr.bam"),
        s24=protected("../../data/processed/mapping/211220/S24_dr.bam"),

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
        shell("picard MarkDuplicates I={input.s13}  O={output.s13} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s14}  O={output.s14} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s15}  O={output.s15} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s16}  O={output.s16} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s17}  O={output.s17} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s18}  O={output.s18} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s19}  O={output.s19} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s20}  O={output.s20} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s21}  O={output.s21} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s22}  O={output.s22} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s23}  O={output.s23} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.s24}  O={output.s24} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")

rule coverage_211220:
    input:
        s19=rules.mark_dup211220.output.s19,
        s20=rules.mark_dup211220.output.s20,
        s21=rules.mark_dup211220.output.s21,
        s22=rules.mark_dup211220.output.s22,
        s23=rules.mark_dup211220.output.s23,
    params:
        b="50", norm="BPM",  pmgs="7451359", pcgs="7661456", f="bigwig"
    output:
        s19="../../data/processed/mapping/211220/S19_dr.bw",
        s20="../../data/processed/mapping/211220/S20_dr.bw",
        s21="../../data/processed/mapping/211220/S21_dr.bw",
        s22="../../data/processed/mapping/211220/S22_dr.bw",
        s23="../../data/processed/mapping/211220/S23_dr.bw",
    threads: 6
    run:
        shell("bamCoverage -p {threads} -b {input.s19} -o {output.s19} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s20} -o {output.s20} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s21} -o {output.s21} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s22} -o {output.s22} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.s23} -o {output.s23} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} -of {params.f} --centerReads")
