### rule all
rule bt2:
    input:
        hu="/nethome/cisseoh/DATA/genomesDB/human/hg18",
        mk="/nethome/cisseoh/DATA/genomesDB/monkey/monkey",
        mc="/nethome/cisseoh/DATA/genomesDB/mouse/mouse",
        s1r1="../../data/raw/211220/S1_1.fastq.gz",s1r2="../../data/raw/211220/S1_2.fastq.gz",
        s2r1="../../data/raw/211220/S2_1.fastq.gz",s2r2="../../data/raw/211220/S2_2.fastq.gz",
        s3r1="../../data/raw/211220/S3_1.fastq.gz",s3r2="../../data/raw/211220/S3_2.fastq.gz",
        s4r1="../../data/raw/211220/S4_1.fastq.gz",s4r2="../../data/raw/211220/S4_2.fastq.gz",
        s5r1="../../data/raw/211220/S5_1.fastq.gz",s5r2="../../data/raw/211220/S5_2.fastq.gz",
        s6r1="../../data/raw/211220/S6_1.fastq.gz",s6r2="../../data/raw/211220/S6_2.fastq.gz",
        s7r1="../../data/raw/211220/S7_1.fastq.gz",s7r2="../../data/raw/211220/S7_2.fastq.gz",
        s8r1="../../data/raw/211220/S8_1.fastq.gz",s8r2="../../data/raw/211220/S8_2.fastq.gz",
        s9r1="../../data/raw/211220/S9_1.fastq.gz",s9r2="../../data/raw/211220/S9_2.fastq.gz",
        s10r1="../../data/raw/211220/S10_1.fastq.gz",s10r2="../../data/raw/211220/S10_2.fastq.gz",
        s11r1="../../data/raw/211220/S11_1.fastq.gz",s11r2="../../data/raw/211220/S11_2.fastq.gz",
        s12r1="../../data/raw/211220/S12_1.fastq.gz",s12r2="../../data/raw/211220/S12_2.fastq.gz",
        s13r1="../../data/raw/211220/S13_1.fastq.gz",s13r2="../../data/raw/211220/S13_2.fastq.gz",
        s14r1="../../data/raw/211220/S14_1.fastq.gz",s14r2="../../data/raw/211220/S14_2.fastq.gz",
        s15r1="../../data/raw/211220/S15_1.fastq.gz",s15r2="../../data/raw/211220/S15_2.fastq.gz",
        s16r1="../../data/raw/211220/S16_1.fastq.gz",s16r2="../../data/raw/211220/S16_2.fastq.gz",
        s17r1="../../data/raw/211220/S17_1.fastq.gz",s17r2="../../data/raw/211220/S17_2.fastq.gz",
        s18r1="../../data/raw/211220/S18_1.fastq.gz",s18r2="../../data/raw/211220/S18_2.fastq.gz",
        s19r1="../../data/raw/211220/S19_1.fastq.gz",s19r2="../../data/raw/211220/S19_2.fastq.gz",
        s20r1="../../data/raw/211220/S20_1.fastq.gz",s20r2="../../data/raw/211220/S20_2.fastq.gz",
        s21r1="../../data/raw/211220/S21_1.fastq.gz",s21r2="../../data/raw/211220/S21_2.fastq.gz",
        s22r1="../../data/raw/211220/S22_1.fastq.gz",s22r2="../../data/raw/211220/S22_2.fastq.gz",
        s23r1="../../data/raw/211220/S23_1.fastq.gz",s23r2="../../data/raw/211220/S23_2.fastq.gz",
        s24r1="../../data/raw/211220/S24_1.fastq.gz",s24r2="../../data/raw/211220/S24_2.fastq.gz",

    threads: 12

    params:
        d="/dev/null"

    output:
        s1="../../data/processed/host_removed/211220/S1",
        s2="../../data/processed/host_removed/211220/S2",
        s3="../../data/processed/host_removed/211220/S3",
        s4="../../data/processed/host_removed/211220/S4",
        s5="../../data/processed/host_removed/211220/S5",
        s6="../../data/processed/host_removed/211220/S6",
        s7="../../data/processed/host_removed/211220/S7",
        s8="../../data/processed/host_removed/211220/S8",
        s9="../../data/processed/host_removed/211220/S9",
        s10="../../data/processed/host_removed/211220/S10",
        s11="../../data/processed/host_removed/211220/S11",
        s12="../../data/processed/host_removed/211220/S12",
        s13="../../data/processed/host_removed/211220/S13",
        s14="../../data/processed/host_removed/211220/S14",
        s15="../../data/processed/host_removed/211220/S15",
        s16="../../data/processed/host_removed/211220/S16",
        s17="../../data/processed/host_removed/211220/S17",
        s18="../../data/processed/host_removed/211220/S18",
        s19="../../data/processed/host_removed/211220/S19",
        s20="../../data/processed/host_removed/211220/S20",
        s21="../../data/processed/host_removed/211220/S21",
        s22="../../data/processed/host_removed/211220/S22",
        s23="../../data/processed/host_removed/211220/S23",
        s24="../../data/processed/host_removed/211220/S24",

    run:
        shell("echo > {output.s1} && bowtie2 -p {threads} -x {input.mk} -1 {input.s1r1} -2 {input.s1r2} --un-conc-gz {output.s1} > {params.d}")
        shell("echo > {output.s2} && bowtie2 -p {threads} -x {input.mk} -1 {input.s2r1} -2 {input.s2r2} --un-conc-gz {output.s2} > {params.d}")
        shell("echo > {output.s3} && bowtie2 -p {threads} -x {input.mk} -1 {input.s3r1} -2 {input.s3r2} --un-conc-gz {output.s3} > {params.d}")
        shell("echo > {output.s4} && bowtie2 -p {threads} -x {input.mk} -1 {input.s4r1} -2 {input.s4r2} --un-conc-gz {output.s4} > {params.d}")
        shell("echo > {output.s5} && bowtie2 -p {threads} -x {input.mk} -1 {input.s5r1} -2 {input.s5r2} --un-conc-gz {output.s5} > {params.d}")
        shell("echo > {output.s6} && bowtie2 -p {threads} -x {input.mk} -1 {input.s6r1} -2 {input.s6r2} --un-conc-gz {output.s6} > {params.d}")
        shell("echo > {output.s7} && bowtie2 -p {threads} -x {input.mk} -1 {input.s7r1} -2 {input.s7r2} --un-conc-gz {output.s7} > {params.d}")
        shell("echo > {output.s8} && bowtie2 -p {threads} -x {input.mk} -1 {input.s8r1} -2 {input.s8r2} --un-conc-gz {output.s8} > {params.d}")
        shell("echo > {output.s9} && bowtie2 -p {threads} -x {input.mk} -1 {input.s9r1} -2 {input.s9r2} --un-conc-gz {output.s9} > {params.d}")
        shell("echo > {output.s10} && bowtie2 -p {threads} -x {input.mk} -1 {input.s10r1} -2 {input.s10r2} --un-conc-gz {output.s10} > {params.d}")
        shell("echo > {output.s11} && bowtie2 -p {threads} -x {input.mk} -1 {input.s11r1} -2 {input.s11r2} --un-conc-gz {output.s11} > {params.d}")
        shell("echo > {output.s12} && bowtie2 -p {threads} -x {input.mk} -1 {input.s12r1} -2 {input.s12r2} --un-conc-gz {output.s12} > {params.d}")
        shell("echo > {output.s13} && bowtie2 -p {threads} -x {input.hu} -1 {input.s13r1} -2 {input.s13r2} --un-conc-gz {output.s13} > {params.d}")
        shell("echo > {output.s14} && bowtie2 -p {threads} -x {input.hu} -1 {input.s14r1} -2 {input.s14r2} --un-conc-gz {output.s14} > {params.d}")
        shell("echo > {output.s15} && bowtie2 -p {threads} -x {input.hu} -1 {input.s15r1} -2 {input.s15r2} --un-conc-gz {output.s15} > {params.d}")
        shell("echo > {output.s16} && bowtie2 -p {threads} -x {input.hu} -1 {input.s16r1} -2 {input.s16r2} --un-conc-gz {output.s16} > {params.d}")
        shell("echo > {output.s17} && bowtie2 -p {threads} -x {input.hu} -1 {input.s17r1} -2 {input.s17r2} --un-conc-gz {output.s17} > {params.d}")
        shell("echo > {output.s18} && bowtie2 -p {threads} -x {input.hu} -1 {input.s18r1} -2 {input.s18r2} --un-conc-gz {output.s18} > {params.d}")
        shell("echo > {output.s19} && bowtie2 -p {threads} -x {input.mc} -1 {input.s19r1} -2 {input.s19r2} --un-conc-gz {output.s19} > {params.d}")
        shell("echo > {output.s20} && bowtie2 -p {threads} -x {input.mc} -1 {input.s20r1} -2 {input.s20r2} --un-conc-gz {output.s20} > {params.d}")
        shell("echo > {output.s21} && bowtie2 -p {threads} -x {input.mc} -1 {input.s21r1} -2 {input.s21r2} --un-conc-gz {output.s21} > {params.d}")
        shell("echo > {output.s22} && bowtie2 -p {threads} -x {input.mc} -1 {input.s22r1} -2 {input.s22r2} --un-conc-gz {output.s22} > {params.d}")
        shell("echo > {output.s23} && bowtie2 -p {threads} -x {input.mc} -1 {input.s23r1} -2 {input.s23r2} --un-conc-gz {output.s23} > {params.d}")
        shell("echo > {output.s24} && bowtie2 -p {threads} -x {input.mc} -1 {input.s24r1} -2 {input.s24r2} --un-conc-gz {output.s24} > {params.d}")

