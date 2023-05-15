### rule all
rule bt2:
    input:
        rt="/nethome/cisseoh/DATA/genomesDB/rat/rat",
        mc="/nethome/cisseoh/DATA/genomesDB/mouse/mouse",
        s1r1="../../data/raw/220606/S1_1.fastq.gz",s1r2="../../data/raw/220606/S1_2.fastq.gz",
        s5r1="../../data/raw/220606/S5_1.fastq.gz",s5r2="../../data/raw/220606/S5_2.fastq.gz",
        s6r1="../../data/raw/220606/S6_1.fastq.gz",s6r2="../../data/raw/220606/S6_2.fastq.gz",
        s8r1="../../data/raw/220606/S8_1.fastq.gz",s8r2="../../data/raw/220606/S8_2.fastq.gz",

    threads: 12

    params:
        d="/dev/null"

    output:
        s1="../../data/processed/host_removed/220606/S1",
        s5="../../data/processed/host_removed/220606/S5",
        s6="../../data/processed/host_removed/220606/S6",
        s8="../../data/processed/host_removed/220606/S8",

    run:
        shell("echo > {output.s1} && bowtie2 -p {threads} -x {input.mc} -1 {input.s1r1} -2 {input.s1r2} --un-conc-gz {output.s1} > {params.d}")
        shell("echo > {output.s5} && bowtie2 -p {threads} -x {input.rt} -1 {input.s5r1} -2 {input.s5r2} --un-conc-gz {output.s5} > {params.d}")
        shell("echo > {output.s6} && bowtie2 -p {threads} -x {input.rt} -1 {input.s6r1} -2 {input.s6r2} --un-conc-gz {output.s6} > {params.d}")
        shell("echo > {output.s8} && bowtie2 -p {threads} -x {input.rt} -1 {input.s8r1} -2 {input.s8r2} --un-conc-gz {output.s8} > {params.d}")

