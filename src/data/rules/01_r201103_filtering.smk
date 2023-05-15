### rule all
rule bt2:
    input:
        hg="/nethome/cisseoh/DATA/genomesDB/human/hg18",
        mk="/nethome/cisseoh/DATA/genomesDB/monkey/monkey",
        rt="/nethome/cisseoh/DATA/genomesDB/rat/rat",
        mc="/nethome/cisseoh/DATA/genomesDB/mouse/mouse",
        pcar1="../../data/raw/201103/Pc-A_R1.fastq.gz",
        pcar2="../../data/raw/201103/Pc-A_R2.fastq.gz",
        pccr1="../../data/raw/201103/Pc-C_R1.fastq.gz",
        pccr2="../../data/raw/201103/Pc-C_R2.fastq.gz",
        pcpar1="../../data/raw/201103/Pc-PA_R1.fastq.gz",
        pcpar2="../../data/raw/201103/Pc-PA_R2.fastq.gz",
        pcpcr1="../../data/raw/201103/Pc-PC_R1.fastq.gz",pcpcr2="../../data/raw/201103/Pc-PC_R2.fastq.gz",
        pjar1="../../data/raw/201103/Pj-A_R1.fastq.gz",pjar2="../../data/raw/201103/Pj-A_R2.fastq.gz",
        pjcr1="../../data/raw/201103/Pj-C_R1.fastq.gz",pjcr2="../../data/raw/201103/Pj-C_R2.fastq.gz",
        pjpar1="../../data/raw/201103/Pj-PA_R1.fastq.gz",pjpar2="../../data/raw/201103/Pj-PA_R2.fastq.gz",
        pjpcr1="../../data/raw/201103/Pj-PC_R1.fastq.gz",pjpcr2="../../data/raw/201103/Pj-PC_R2.fastq.gz",
        pmacar1="../../data/raw/201103/Pmac-A_R1.fastq.gz",pmacar2="../../data/raw/201103/Pmac-A_R2.fastq.gz",
        pmaccr1="../../data/raw/201103/Pmac-C_R1.fastq.gz",pmaccr2="../../data/raw/201103/Pmac-C_R2.fastq.gz",
        pmacigr1="../../data/raw/201103/Pmac-IG_R1.fastq.gz",pmacigr2="../../data/raw/201103/Pmac-IG_R2.fastq.gz",
        pmacnr1="../../data/raw/201103/Pmac-N_R1.fastq.gz",pmacnr2="../../data/raw/201103/Pmac-N_R2.fastq.gz",
        u6r1="../../data/raw/201103/Undetermined_S0_L006_R1_001.fastq.gz",u6r2="../../data/raw/201103/Undetermined_S0_L006_R2_001.fastq.gz",
        u7r1="../../data/raw/201103/Undetermined_S0_L007_R1_001.fastq.gz",u7r2="../../data/raw/201103/Undetermined_S0_L007_R2_001.fastq.gz",
        u8r1="../../data/raw/201103/Undetermined_S0_L008_R1_001.fastq.gz",u8r2="../../data/raw/201103/Undetermined_S0_L008_R2_001.fastq.gz",
        d13ar1="../../data/raw/201103/d13-A_R1.fastq.gz",d13ar2="../../data/raw/201103/d13-A_R2.fastq.gz",
        d13cr1="../../data/raw/201103/d13-C_R1.fastq.gz",d13cr2="../../data/raw/201103/d13-C_R2.fastq.gz",
        d13par1="../../data/raw/201103/d13-PA_R1.fastq.gz",d13par2="../../data/raw/201103/d13-PA_R2.fastq.gz",
        d13pcr1="../../data/raw/201103/d13-PC_R1.fastq.gz",d13pcr2="../../data/raw/201103/d13-PC_R2.fastq.gz",
        d14ar1="../../data/raw/201103/d14-A_R1.fastq.gz",d14ar2="../../data/raw/201103/d14-A_R2.fastq.gz",
        d14cr1="../../data/raw/201103/d14-C_R1.fastq.gz",d14cr2="../../data/raw/201103/d14-C_R2.fastq.gz",
        d14par1="../../data/raw/201103/d14-PA_R1.fastq.gz",d14par2="../../data/raw/201103/d14-PA_R2.fastq.gz",
        d14pcr1="../../data/raw/201103/d14-PC_R1.fastq.gz",d14pcr2="../../data/raw/201103/d14-PC_R2.fastq.gz",
        d3ar1="../../data/raw/201103/d3-A_R1.fastq.gz",d3ar2="../../data/raw/201103/d3-A_R2.fastq.gz",
        d3cr1="../../data/raw/201103/d3-C_R1.fastq.gz",d3cr2="../../data/raw/201103/d3-C_R2.fastq.gz",
        d3par1="../../data/raw/201103/d3-PA_R1.fastq.gz",d3par2="../../data/raw/201103/d3-PA_R2.fastq.gz",
        d3pcr1="../../data/raw/201103/d3-PC_R1.fastq.gz",d3pcr2="../../data/raw/201103/d3-PC_R2.fastq.gz",
        d7ar1="../../data/raw/201103/d7-A_R1.fastq.gz",d7ar2="../../data/raw/201103/d7-A_R2.fastq.gz",
        d7cr1="../../data/raw/201103/d7-C_R1.fastq.gz",d7cr2="../../data/raw/201103/d7-C_R2.fastq.gz",
        d7par1="../../data/raw/201103/d7-PA_R1.fastq.gz",d7par2="../../data/raw/201103/d7-PA_R2.fastq.gz",
        d7pcr1="../../data/raw/201103/d7-PC_R1.fastq.gz",d7pcr2="../../data/raw/201103/d7-PC_R2.fastq.gz",

    threads: 16

    params:
        d="/dev/null"

    output:
#        pca="../../data/processed/host_removed/201103/Pc-A_clean",
#        pcc="../../data/processed/host_removed/201103/Pc-C_clean", 
#         pcpa="../../data/processed/host_removed/201103/Pc-PA_clean",
#        pcpc="../../data/processed/host_removed/201103/Pc-PC_clean", 
        pja="../../data/processed/host_removed/201103/Pj-A_clean",
#        pjc="../../data/processed/host_removed/201103/Pj-C_clean",
#        pjpa="../../data/processed/host_removed/201103/Pj-PA_clean",
#        pjpc="../../data/processed/host_removed/201103/Pj-PC_clean",
#        pmaca="../../data/processed/host_removed/201103/Pmac-A_clean",pmacc="../../data/processed/host_removed/201103/Pmac-C_clean",
#        pmacig="../../data/processed/host_removed/201103/Pmac-IG_clean",pmacn="../../data/processed/host_removed/201103/Pmac-N_clean",
#        u6="../../data/processed/host_removed/201103/U6_clean",
#        u7="../../data/processed/host_removed/201103/U7_clean",
#        u8="../../data/processed/host_removed/201103/U8_clean",     
#        d13a="../../data/raw/201103/d13-A_clean",d13c="../../data/raw/201103/d13-C_clean",
#        d13pa="../../data/raw/201103/d13-PA_clean",d13pc="../../data/raw/201103/d13-PC_clean",
#        d14a="../../data/raw/201103/d14-A_clean",d14c="../../data/raw/201103/d14-C_clean",
#        d14pa="../../data/raw/201103/d14-PA_clean",d14pc="../../data/raw/201103/d14-PC_clean",
#        d7a="../../data/raw/201103/d7-A_clean",d7c="../../data/raw/201103/d7-C_clean",
#        d7pa="../../data/raw/201103/d7-PA_clean",d7pc="../../data/raw/201103/d7-PC_clean",
    
    run:
#        shell("bowtie2 -p {threads} -x {input.rt} -1 {input.pcar1} -2 {input.pcar2} --un-conc-gz {output.pca} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.rt} -1 {input.pccr1} -2 {input.pccr2} --un-conc-gz {output.pcc} > {params.d}") 
#         shell("bowtie2 -p {threads} -x {input.rt} -1 {input.pcpar1} -2 {input.pcpar2} --un-conc-gz {output.pcpa} > {params.d}")
#         shell("bowtie2 -p {threads} -x {input.rt} -1 {input.pcpcr1} -2 {input.pcpcr2} --un-conc-gz {output.pcpc} > {params.d}")
        
         shell("bowtie2 -p {threads} -x {input.hg} -1 {input.pjar1} -2 {input.pjar2} --un-conc-gz {output.pja} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.hg} -1 {input.pjcr1} -2 {input.pjcr2} --un-conc-gz {output.pjc} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.hg} -1 {input.pjpar1} -2 {input.pjpar2} --un-conc-gz {output.pjpa} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.hg} -1 {input.pjpcr1} -2 {input.pjpcr2} --un-conc-gz {output.pjpc} > {params.d}")
    
#        shell("bowtie2 -p {threads} -x {input.mk} -1 {input.pmacar1} -2 {input.pmacar2} --un-conc-gz {output.pmaca} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mk} -1 {input.pmaccr1} -2 {input.pmaccr2} --un-conc-gz {output.pmacc} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mk} -1 {input.pmacigr1} -2 {input.pmacigr2} --un-conc-gz {output.pmacig} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mk} -1 {input.pmacnr1} -2 {input.pmacnr2} --un-conc-gz {output.pmacn} > {params.d}")

#        shell("bowtie2 -p {threads} -x {input.mc} -1 {inputu6r1} -2 {input.u6r2} --un-conc-gz {output.u6} > {params.d}") # guess its mice but could be anything
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {inputu7r1} -2 {input.u7r2} --un-conc-gz {output.u7} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {inputu8r1} -2 {input.u8r2} --un-conc-gz {output.u8} > {params.d}")

#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d13ar1} -2 {input.d13ar2} --un-conc-gz {output.d13a} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d13cr1} -2 {input.d13cr2} --un-conc-gz {output.d13c} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d13par1} -2 {input.d13par2} --un-conc-gz {output.d13pa} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d13pcr1} -2 {input.d13pcr2} --un-conc-gz {output.d13pc} > {params.d}")
        
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d14ar1} -2 {input.d14ar2} --un-conc-gz {output.d14a} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d14cr1} -2 {input.d14cr2} --un-conc-gz {output.d14c} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d14par1} -2 {input.d14par2} --un-conc-gz {output.d14pa} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d14pcr1} -2 {input.d14pcr2} --un-conc-gz {output.d14pc} > {params.d}")

#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d7ar1} -2 {input.d7ar2} --un-conc-gz {output.d7a} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d7cr1} -2 {input.d7cr2} --un-conc-gz {output.d7c} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d7par1} -2 {input.d7par2} --un-conc-gz {output.d7pa} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d7pcr1} -2 {input.d7pcr2} --un-conc-gz {output.d7pc} > {params.d}")

#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d3ar1} -2 {input.d3ar2} --un-conc-gz {output.d3a} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d3cr1} -2 {input.d3cr2} --un-conc-gz {output.d3c} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d3par1} -2 {input.d3par2} --un-conc-gz {output.d3pa} > {params.d}")
#        shell("bowtie2 -p {threads} -x {input.mc} -1 {input.d3pcr1} -2 {input.d3pcr2} --un-conc-gz {output.d3pc} > {params.d}")
