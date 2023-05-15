### rule all
rule bt2:
    input:
        rt="/nethome/cisseoh/DATA/genomesDB/rat/rat",
        s1r1="../../data/raw/210927/S1_R1.fastq.gz",
        s1r2="../../data/raw/210927/S1_R2.fastq.gz",
        s2r1="../../data/raw/210927/S2_R1.fastq.gz",
        s2r2="../../data/raw/210927/S2_R2.fastq.gz",
        s3r1="../../data/raw/210927/S3_R1.fastq.gz",
        s3r2="../../data/raw/210927/S3_R2.fastq.gz",
        s4r1="../../data/raw/210927/S4_R1.fastq.gz",
        s4r2="../../data/raw/210927/S4_R2.fastq.gz",
        s5r1="../../data/raw/210927/S5_R1.fastq.gz",
        s5r2="../../data/raw/210927/S5_R2.fastq.gz",
        s6r1="../../data/raw/210927/S6_R1.fastq.gz",
        s6r2="../../data/raw/210927/S6_R2.fastq.gz",
        s7r1="../../data/raw/210927/S7_R1.fastq.gz",
        s7r2="../../data/raw/210927/S7_R2.fastq.gz",
        s8r1="../../data/raw/210927/S8_R1.fastq.gz",
        s8r2="../../data/raw/210927/S8_R2.fastq.gz",
        s9r1="../../data/raw/210927/S9_R1.fastq.gz",
        s9r2="../../data/raw/210927/S9_R2.fastq.gz",
        s10r1="../../data/raw/210927/S10_R1.fastq.gz",
        s10r2="../../data/raw/210927/S10_R2.fastq.gz",
        s11r1="../../data/raw/210927/S11_R1.fastq.gz",
        s11r2="../../data/raw/210927/S11_R2.fastq.gz",
        s12r1="../../data/raw/210927/S12_R1.fastq.gz",
        s12r2="../../data/raw/210927/S12_R2.fastq.gz",

    threads: 12

    params:
        d="/dev/null"

    output:
        s1="../../data/processed/host_removed/210927/S1",
        s2="../../data/processed/host_removed/210927/S2",
        s3="../../data/processed/host_removed/210927/S3",
        s4="../../data/processed/host_removed/210927/S4",
        s5="../../data/processed/host_removed/210927/S5",
        s6="../../data/processed/host_removed/210927/S6",
        s7="../../data/processed/host_removed/210927/S7",
        s8="../../data/processed/host_removed/210927/S8",
        s9="../../data/processed/host_removed/210927/S9",
        s10="../../data/processed/host_removed/210927/S10",
        s11="../../data/processed/host_removed/210927/S11",
        s12="../../data/processed/host_removed/210927/S12",
    run:
        shell("echo > {output.s1} && bowtie2 -p {threads} -x {input.rt} -1 {input.s1r1} -2 {input.s1r2} --un-conc-gz {output.s1} > {params.d}")
        shell("echo > {output.s2} && bowtie2 -p {threads} -x {input.rt} -1 {input.s2r1} -2 {input.s2r2} --un-conc-gz {output.s2} > {params.d}")
        shell("echo > {output.s3} && bowtie2 -p {threads} -x {input.rt} -1 {input.s3r1} -2 {input.s3r2} --un-conc-gz {output.s3} > {params.d}")
        shell("echo > {output.s4} && bowtie2 -p {threads} -x {input.rt} -1 {input.s4r1} -2 {input.s4r2} --un-conc-gz {output.s4} > {params.d}")
        shell("echo > {output.s5} && bowtie2 -p {threads} -x {input.rt} -1 {input.s5r1} -2 {input.s5r2} --un-conc-gz {output.s5} > {params.d}")
        shell("echo > {output.s6} && bowtie2 -p {threads} -x {input.rt} -1 {input.s6r1} -2 {input.s6r2} --un-conc-gz {output.s6} > {params.d}")
        shell("echo > {output.s7} && bowtie2 -p {threads} -x {input.rt} -1 {input.s7r1} -2 {input.s7r2} --un-conc-gz {output.s7} > {params.d}")
        shell("echo > {output.s8} && bowtie2 -p {threads} -x {input.rt} -1 {input.s8r1} -2 {input.s8r2} --un-conc-gz {output.s8} > {params.d}")
        shell("echo > {output.s9} && bowtie2 -p {threads} -x {input.rt} -1 {input.s9r1} -2 {input.s9r2} --un-conc-gz {output.s9} > {params.d}")
        shell("echo > {output.s10} && bowtie2 -p {threads} -x {input.rt} -1 {input.s10r1} -2 {input.s10r2} --un-conc-gz {output.s10} > {params.d}")
        shell("echo > {output.s11} && bowtie2 -p {threads} -x {input.rt} -1 {input.s11r1} -2 {input.s11r2} --un-conc-gz {output.s11} > {params.d}")
        shell("echo > {output.s12} && bowtie2 -p {threads} -x {input.rt} -1 {input.s12r1} -2 {input.s12r2} --un-conc-gz {output.s12} > {params.d}")

