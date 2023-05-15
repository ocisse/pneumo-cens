### rule all
rule bt2:
    input:
        rt="/nethome/cisseoh/DATA/genomesDB/rat/rat",
        s1r1="../../data/raw/221005/S1_1.fastq.gz",s1r2="../../data/raw/221005/S1_2.fastq.gz",
        s2r1="../../data/raw/221005/S2_1.fastq.gz",s2r2="../../data/raw/221005/S2_2.fastq.gz",
        s3r1="../../data/raw/221005/S3_1.fastq.gz",s3r2="../../data/raw/221005/S3_2.fastq.gz",
        s4r1="../../data/raw/221005/S4_1.fastq.gz",s4r2="../../data/raw/221005/S4_2.fastq.gz",

    threads: 12

    params:
        d="/dev/null"

    output:
        s1="../../data/processed/host_removed/221005/S1",
        s2="../../data/processed/host_removed/221005/S2",
        s3="../../data/processed/host_removed/221005/S3",
        s4="../../data/processed/host_removed/221005/S4",

    run:
        shell("echo > {output.s1} && bowtie2 -p {threads} -x {input.rt} -1 {input.s1r1} -2 {input.s1r2} --un-conc-gz {output.s1} > {params.d}")
        shell("echo > {output.s2} && bowtie2 -p {threads} -x {input.rt} -1 {input.s2r1} -2 {input.s2r2} --un-conc-gz {output.s2} > {params.d}")
        shell("echo > {output.s3} && bowtie2 -p {threads} -x {input.rt} -1 {input.s3r1} -2 {input.s3r2} --un-conc-gz {output.s3} > {params.d}")
        shell("echo > {output.s4} && bowtie2 -p {threads} -x {input.rt} -1 {input.s4r1} -2 {input.s4r2} --un-conc-gz {output.s4} > {params.d}")

