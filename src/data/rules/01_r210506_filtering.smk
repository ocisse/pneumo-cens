### rule all
rule bt2:
    input:
        hg="/nethome/cisseoh/DATA/genomesDB/human/hg18",
        mk="/nethome/cisseoh/DATA/genomesDB/monkey/monkey",
        rt="/nethome/cisseoh/DATA/genomesDB/rat/rat",
        mc="/nethome/cisseoh/DATA/genomesDB/mouse/mouse",
        p2cnr1="../../data/raw/210506/P2CN_R1.fastq.gz",
        p2cnr2="../../data/raw/210506/P2CN_R1.fastq.gz",
        p2crgr1="../../data/raw/210506/P2CR_R1.fastq.gz",
        p2crgr2="../../data/raw/210506/P2CR_R2.fastq.gz",
        p3ccr1="../../data/raw/210506/P3CC_R1.fastq.gz",
        p3ccr2="../../data/raw/210506/P3CC_R2.fastq.gz",
        p3cnr1="../../data/raw/210506/P3CN_R1.fastq.gz",
        p3cnr2="../../data/raw/210506/P3CN_R2.fastq.gz",
        pcar1="../../data/raw/210506/PcA_R1.fastq.gz",
        pcar2="../../data/raw/210506/PcA_R2.fastq.gz",
        pccr1="../../data/raw/210506/PcC_R1.fastq.gz",
        pccr2="../../data/raw/210506/PcC_R2.fastq.gz",
        pchr1="../../data/raw/210506/PcH_R1.fastq.gz",
        pchr2="../../data/raw/210506/PcH_R2.fastq.gz",
        pcnr1="../../data/raw/210506/PcN_R1.fastq.gz",
        pcnr2="../../data/raw/210506/PcN_R2.fastq.gz",
        spar1="../../data/raw/210506/SpA_R1.fastq.gz",
        spar2="../../data/raw/210506/SpA_R2.fastq.gz",
        spcr1="../../data/raw/210506/SpC_R1.fastq.gz",
        spcr2="../../data/raw/210506/SpC_R2.fastq.gz",
        sphr1="../../data/raw/210506/SpH_R1.fastq.gz",
        sphr2="../../data/raw/210506/SpH_R2.fastq.gz",
        spnr1="../../data/raw/210506/SpN_R1.fastq.gz",
        spnr2="../../data/raw/210506/SpN_R2.fastq.gz",
        
    threads: 12

    params:
        d="/dev/null"

    output:
        p2cn="../../data/processed/host_removed/210506/P2CN",
        p2crg="../../data/processed/host_removed/210506/P2CR",
        p3cc="../../data/processed/host_removed/210506/P3CC",
        p3cn="../../data/processed/host_removed/210506/P3CN",
        pca="../../data/processed/host_removed/210506/PcA",
        pcc="../../data/processed/host_removed/210506/PcC",
        pch="../../data/processed/host_removed/210506/PcH",
        pcn="../../data/processed/host_removed/210506/PcN",
        spa="../../data/processed/host_removed/210506/SpA",
        spc="../../data/processed/host_removed/210506/SpC",
        sph="../../data/processed/host_removed/210506/SpH",
        spn="../../data/processed/host_removed/210506/SpN",
 
    run:
        shell("echo > {output.spa} && bowtie2 -p {threads} -x {input.hg} -1 {input.spar1} -2 {input.spar2} --un-conc-gz {output.spa} > {params.d}")
        shell("echo > {output.spc} && bowtie2 -p {threads} -x {input.hg} -1 {input.spcr1} -2 {input.spcr2} --un-conc-gz {output.spc} > {params.d}")
        shell("echo > {output.sph} && bowtie2 -p {threads} -x {input.hg} -1 {input.sphr1} -2 {input.sphr2} --un-conc-gz {output.sph} > {params.d}")
        shell("echo > {output.spn} && bowtie2 -p {threads} -x {input.hg} -1 {input.spnr1} -2 {input.spnr2} --un-conc-gz {output.spn} > {params.d}")
        shell("echo > {output.p2cn} && bowtie2 -p {threads} -x {input.mk} -1 {input.p2cnr1} -2 {input.p2cnr2} --un-conc-gz {output.p2cn} > {params.d}")
        shell("echo > {output.p2crg} && bowtie2 -p {threads} -x {input.mk} -1 {input.p2crgr1} -2 {input.p2crgr2} --un-conc-gz {output.p2crg} > {params.d}")
        shell("echo > {output.p3cc} && bowtie2 -p {threads} -x {input.mk} -1 {input.p3ccr1} -2 {input.p3ccr2} --un-conc-gz {output.p3cc} > {params.d}")
        shell("echo > {output.p3cn} && bowtie2 -p {threads} -x {input.mk} -1 {input.p3cnr1} -2 {input.p3cnr2} --un-conc-gz {output.p3cn} > {params.d}")
        shell("echo > {output.pca} && bowtie2 -p {threads} -x {input.rt} -1 {input.pcar1} -2 {input.pcar2} --un-conc-gz {output.pca} > {params.d}")
        shell("echo > {output.pcc} && bowtie2 -p {threads} -x {input.rt} -1 {input.pccr1} -2 {input.pccr2} --un-conc-gz {output.pcc} > {params.d}")
        shell("echo > {output.pch} && bowtie2 -p {threads} -x {input.rt} -1 {input.pchr1} -2 {input.pchr2} --un-conc-gz {output.pch} > {params.d}")        
        shell("echo > {output.pcn} && bowtie2 -p {threads} -x {input.rt} -1 {input.pcnr1} -2 {input.pcnr2} --un-conc-gz {output.pcn} > {params.d}")


