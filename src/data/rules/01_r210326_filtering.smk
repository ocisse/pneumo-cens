### rule all
rule bt2:
    input:
        hg="/nethome/cisseoh/DATA/genomesDB/human/hg18",
        mk="/nethome/cisseoh/DATA/genomesDB/monkey/monkey",
        rt="/nethome/cisseoh/DATA/genomesDB/rat/rat",
        mc="/nethome/cisseoh/DATA/genomesDB/mouse/mouse",
        pmd0ar1="../../data/raw/210326/1A_R1.fastq.gz",pmd0ar2="../../data/raw/210326/1A_R2.fastq.gz",
        pmd0hr1="../../data/raw/210326/1H_R1.fastq.gz",pmd0hr2="../../data/raw/210326/1H_R2.fastq.gz",
        pmd7ar1="../../data/raw/210326/2A_R1.fastq.gz",pmd7ar2="../../data/raw/210326/2A_R2.fastq.gz",
        pmd7hr1="../../data/raw/210326/2H_R1.fastq.gz",pmd7hr2="../../data/raw/210326/2H_R2.fastq.gz",
        pmd14ar1="../../data/raw/210326/3A_R1.fastq.gz",pmd14ar2="../../data/raw/210326/3A_R2.fastq.gz",
        pmd14hr1="../../data/raw/210326/3H_R1.fastq.gz",pmd14hr2="../../data/raw/210326/3H_R2.fastq.gz",
        p3car1="../../data/raw/210326/4A_R1.fastq.gz",p3car2="../../data/raw/210326/4A_R2.fastq.gz",
        p3chr1="../../data/raw/210326/4H_R1.fastq.gz",p3chr2="../../data/raw/210326/4H_R2.fastq.gz",
        zar1="../../data/raw/210326/5A_R1.fastq.gz",zar2="../../data/raw/210326/5A_R2.fastq.gz",
        zhr1="../../data/raw/210326/5H_R1.fastq.gz",zhr2="../../data/raw/210326/5H_R2.fastq.gz",
        p2car1="../../data/raw/210326/6A_R1.fastq.gz",p2car2="../../data/raw/210326/6A_R2.fastq.gz",
        p2chr1="../../data/raw/210326/6H_R1.fastq.gz",p2chr2="../../data/raw/210326/6H_R2.fastq.gz",

    threads: 16

    params:
        d="/dev/null"

    output:
        pmd0a="../../data/processed/host_removed/210326/Pm_Inc_A_clean",
        pmd0h="../../data/processed/host_removed/210326/Pm_Inc_H3_clean",
        pmd7a="../../data/processed/host_removed/210326/Pm_D7_A_clean",
        pmd7h="../../data/processed/host_removed/210326/Pm_D7_H3_clean",
        pmd14a="../../data/processed/host_removed/210326/Pm_D14_A_clean",
        pmd14h="../../data/processed/host_removed/210326/Pm_D14_H3_clean",
        p3ca="../../data/processed/host_removed/210326/PmacP3C_A_clean",
        p3ch="../../data/processed/host_removed/210326/PmacP3C_H3_clean",
        za="../../data/processed/host_removed/210326/PjZA_A_clean",
        zh="../../data/processed/host_removed/210326/PjZA_H_clean",
        p2ca="../../data/processed/host_removed/210326/PmacP2C_A_clean",
        p2ch="../../data/processed/host_removed/210326/PmacP2C_H3_clean",
 
    run:
        shell("bowtie2 -p {threads} -x {input.hg} -1 {input.zar1} -2 {input.zar2} --un-conc-gz {output.za} > {params.d}")
        shell("bowtie2 -p {threads} -x {input.hg} -1 {input.zhr1} -2 {input.zhr2} --un-conc-gz {output.zh} > {params.d}")
        shell("bowtie2 -p {threads} -x {input.mk} -1 {input.p3car1} -2 {input.p3car2} --un-conc-gz {output.p3ca} > {params.d}")
        shell("bowtie2 -p {threads} -x {input.mk} -1 {input.p3chr1} -2 {input.p3chr2} --un-conc-gz {output.p3ch} > {params.d}")
        shell("bowtie2 -p {threads} -x {input.mk} -1 {input.p2car1} -2 {input.p2car2} --un-conc-gz {output.p2ca} > {params.d}")
        shell("bowtie2 -p {threads} -x {input.mk} -1 {input.p2chr1} -2 {input.p2chr2} --un-conc-gz {output.p2ch} > {params.d}") 
        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.pmd0ar1} -2 {input.pmd0ar2} --un-conc-gz {output.pmd0a} > {params.d}") 
        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.pmd0hr1} -2 {input.pmd0hr2} --un-conc-gz {output.pmd0h} > {params.d}")
        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.pmd7ar1} -2 {input.pmd7ar2} --un-conc-gz {output.pmd7a} > {params.d}")
        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.pmd7hr1} -2 {input.pmd7hr2} --un-conc-gz {output.pmd7h} > {params.d}")
        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.pmd14ar1} -2 {input.pmd14ar2} --un-conc-gz {output.pmd14a} > {params.d}")
        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.pmd14hr1} -2 {input.pmd14hr2} --un-conc-gz {output.pmd14h} > {params.d}")

