#
rule genomeGenerate:
    input:
        pj="../../../pneumocystis_comparative_genomics/data/raw/Pjir/GCF_001477535.1_Pneu_jiro_RU7_V2_genomic.fna",
        pjgtf="../../../pneumocystis_comparative_genomics/data/raw/Pjir/GCF_001477535.1_Pneu_jiro_RU7_V2_genomic.gtf",
        pmac="../../../pneumocystis_comparative_genomics/data/processed/Pmac/Funannotate/PMAC_NAID_v2/predict_results/Pneumocystis_macacae_NIAID.scaffolds.fa",
        pmacgtf="../../../pneumocystis_comparative_genomics/data/processed/Pmac/Funannotate/PMAC_NAID_v2/predict_results/Pneumocystis_macacae_NIAID.gtf",
        pc="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_genomic.fna",
        pcgtf="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_genomic.gtf",
        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_genomic.fasta",
        pmgtf="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_genomic.gtf",
    
    threads: 6
    output:
        pj=directory("../../data/processed/rnaseq/star/pjg"),
        pmac=directory("../../data/processed/rnaseq/star/pmacg"),
        pc=directory("../../data/processed/rnaseq/star/pcg"),
        pm=directory("../../data/processed/rnaseq/star/pmg"),
        
    params: r="genomeGenerate", o="99", i="10"
    run:
        shell("STAR --runThreadN {threads} --runMode {params.r} --genomeDir {output.pj} --genomeFastaFiles {input.pj} --sjdbGTFfile {input.pjgtf} --sjdbOverhang {params.o} --genomeSAindexNbases {params.i}")
        shell("STAR --runThreadN {threads} --runMode {params.r} --genomeDir {output.pmac} --genomeFastaFiles {input.pmac} --sjdbGTFfile {input.pmacgtf} --sjdbOverhang {params.o} --genomeSAindexNbases {params.i}")
        shell("STAR --runThreadN {threads} --runMode {params.r} --genomeDir {output.pc} --genomeFastaFiles {input.pc} --sjdbGTFfile {input.pcgtf} --sjdbOverhang {params.o} --genomeSAindexNbases {params.i}")
        shell("STAR --runThreadN {threads} --runMode {params.r} --genomeDir {output.pm} --genomeFastaFiles {input.pm} --sjdbGTFfile {input.pmgtf} --sjdbOverhang {params.o} --genomeSAindexNbases {params.i}")

rule star:
    input:
        pjg=rules.genomeGenerate.output.pj,
        pmacg=rules.genomeGenerate.output.pmac,
        pcg=rules.genomeGenerate.output.pc,
        pmg=rules.genomeGenerate.output.pm,
        pjrn1r1="../../data/raw/rnaseq/Pjir/RN/Pj_RN110930_1.fq.gz",
        pjrn1r2="../../data/raw/rnaseq/Pjir/RN/Pj_RN110930_2.fq.gz",
        pjrn2r1="../../data/raw/rnaseq/Pjir/Rulung/Rulung_1.fq.gz",
        pjrn2r2="../../data/raw/rnaseq/Pjir/Rulung/Rulung_2.fq.gz",
        pmacr1="../../data/raw/rnaseq/Pmac/P2C/PMKRNA_1.fq.gz",
        pmacr2="../../data/raw/rnaseq/Pmac/P2C/PMKRNA_2.fq.gz",
        cur1="../../data/raw/rnaseq/Pmur/A549_PC/A549_PC_1.fq.gz",
        cur2="../../data/raw/rnaseq/Pmur/A549_PC/A549_PC_2.fq.gz",
        capr1="../../data/raw/rnaseq/Pmur/Ca1/Caspo_2_1.fastq.gz",
        capr2="../../data/raw/rnaseq/Pmur/Ca1/Caspo_2_2.fastq.gz",
        conr1="../../data/raw/rnaseq/Pmur/Co1/Control_10_1.fastq.gz",
        conr2="../../data/raw/rnaseq/Pmur/Co1/Control_10_2.fastq.gz",
        d21r1="../../data/raw/rnaseq/Pmur/LS02192107Y/d21_r1.fq.gz",
        d21r2="../../data/raw/rnaseq/Pmur/LS02192107Y/d21_r2.fq.gz",
        d7r1="../../data/raw/rnaseq/Pmur/LS02192107Y/d7_r1.fq.gz",
        d7r2="../../data/raw/rnaseq/Pmur/LS02192107Y/d7_r2.fq.gz",
        d0r1="../../data/raw/rnaseq/Pmur/LS02192107Y/d0_r1.fq.gz",
        d0r2="../../data/raw/rnaseq/Pmur/LS02192107Y/d0_r2.fq.gz",
        pcr1="../../data/raw/rnaseq/Pcar/Bd/Pc_70954_70955_70956_R1.fasta",
        pcr2="../../data/raw/rnaseq/Pcar/Bd/Pc_70954_70955_70956_R2.fasta",

    output:
        pjrn1="../../data/processed/rnaseq/star/pj/Pj_RN110930",
        pjrn2="../../data/processed/rnaseq/star/pj/Pj_Rlung",
        pmac="../../data/processed/rnaseq/star/pmac/P2C",
        pc="../../data/processed/rnaseq/star/pc/Pcarinii",
        cu="../../data/processed/rnaseq/star/pm/A549_PC",
        cap="../../data/processed/rnaseq/star/pm/Caspo_2",
        con="../../data/processed/rnaseq/star/pm/Control_10",
        d21="../../data/processed/rnaseq/star/pm/LS02192107Y/d21",
        d7="../../data/processed/rnaseq/star/pm/LS02192107Y/d7",
        d0="../../data/processed/rnaseq/star/pm/LS02192107Y/d0",
        
    threads: 12
    params:
        p="--readFilesCommand zcat --outSAMstrandField intronMotif --outSAMattributes NH HI AS nM XS --outSAMtype BAM SortedByCoordinate",
        p2=" --outSAMstrandField intronMotif --outSAMattributes NH HI AS nM XS --outSAMtype BAM SortedByCoordinate",
        p3="--limitBAMsortRAM 1494616844", 
        p4="--limitBAMsortRAM 1469015261",
        p5="--limitBAMsortRAM 1148582946" 
    run:
        shell("echo > {output.pjrn1}")
        shell("STAR --genomeDir {input.pjg} --runThreadN {threads} --readFilesIn {input.pjrn1r1} {input.pjrn1r2} {params.p} --outFileNamePrefix {output.pjrn1}")
        shell("echo > {output.pjrn2}")
        shell("STAR --genomeDir {input.pjg} --runThreadN {threads} --readFilesIn {input.pjrn2r1} {input.pjrn2r2} {params.p} --outFileNamePrefix {output.pjrn2}")
        shell("echo > {output.pmac}")
        shell("STAR --genomeDir {input.pmacg} --runThreadN {threads} --readFilesIn {input.pmacr1} {input.pmacr2} {params.p} --outFileNamePrefix {output.pmac} {params.p3}")
        shell("echo > {output.pc}") 
        shell("STAR --genomeDir {input.pcg} --runThreadN {threads} --readFilesIn {input.pcr1} {input.pcr2} {params.p2} --outFileNamePrefix {output.pc} {params.p4}") 
        shell("echo > {output.cu}")
        shell("STAR --genomeDir {input.pmg} --runThreadN {threads} --readFilesIn {input.cur1} {input.cur2} {params.p} --outFileNamePrefix {output.cu}")
        shell("echo > {output.cap}")
        shell("STAR --genomeDir {input.pmg} --runThreadN {threads} --readFilesIn {input.capr1} {input.capr2} {params.p} --outFileNamePrefix {output.cap}")
        shell("echo > {output.con}")
        shell("STAR --genomeDir {input.pmg} --runThreadN {threads} --readFilesIn {input.conr1} {input.conr2} {params.p} --outFileNamePrefix {output.con}")
        shell("echo > {output.d21}")
        shell("STAR --genomeDir {input.pmg} --runThreadN {threads} --readFilesIn {input.d21r1} {input.d21r2} {params.p} --outFileNamePrefix {output.d21} {params.p5}")
        shell("echo > {output.d7}")
        shell("STAR --genomeDir {input.pmg} --runThreadN {threads} --readFilesIn {input.d7r1} {input.d7r2} {params.p} --outFileNamePrefix {output.d7} {params.p5}")
        shell("echo > {output.d0}")
        shell("STAR --genomeDir {input.pmg} --runThreadN {threads} --readFilesIn {input.d0r1} {input.d0r2} {params.p} --outFileNamePrefix {output.d0} {params.p5}")

rule bamcoverage:
    input:
        pjrn1="../../data/processed/rnaseq/star/pj/Pj_RN110930Aligned.sortedByCoord.out.bam",
        pjrn2="../../data/processed/rnaseq/star/pj/Pj_RlungAligned.sortedByCoord.out.bam",
        pmac="../../data/processed/rnaseq/star/pmac/P2CAligned.sortedByCoord.out.bam",
        pc="../../data/processed/rnaseq/star/pc/PcariniiAligned.sortedByCoord.out.bam",
        cu="../../data/processed/rnaseq/star/pm/A549_PCAligned.sortedByCoord.out.bam",
        cap="../../data/processed/rnaseq/star/pm/Caspo_2Aligned.sortedByCoord.out.bam",
        con="../../data/processed/rnaseq/star/pm/Control_10Aligned.sortedByCoord.out.bam",
        d21="../../data/processed/rnaseq/star/pm/LS02192107Y/d21Aligned.sortedByCoord.out.bam",
        d7="../../data/processed/rnaseq/star/pm/LS02192107Y/d7Aligned.sortedByCoord.out.bam",
        d0="../../data/processed/rnaseq/star/pm/LS02192107Y/d0Aligned.sortedByCoord.out.bam",
    output:
        pjrn1="../../data/processed/rnaseq/star/pj/Pj_RN110930.bw",
        pjrn2="../../data/processed/rnaseq/star/pj/Pj_Rlung.bw",
        pmac="../../data/processed/rnaseq/star/pmac/P2C.bw",
        pc="../../data/processed/rnaseq/star/pc/Pcarinii.bw",
        cu="../../data/processed/rnaseq/star/pm/A549_PC.bw",
        cap="../../data/processed/rnaseq/star/pm/Caspo_2.bw",
        con="../../data/processed/rnaseq/star/pm/Control_10.bw",
        d21="../../data/processed/rnaseq/star/pm/LS02192107Y/d21.bw",
        d7="../../data/processed/rnaseq/star/pm/LS02192107Y/d7.bw",
        d0="../../data/processed/rnaseq/star/pm/LS02192107Y/d0.bw",
    threads: 6
#    resources: tmpdir="/hpcdata/dcr_cc/Ousmane_Data/projects/tmp"
    params:
        b="50", norm="BPM", pmgs="7451359", f="bigwig", pcgs="7661456", pjgs="8396240", pmacgs="8274841"
    run:
        shell("bamCoverage -p {threads} --bam {input.pjrn1} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pjgs} --outFileFormat {params.f} --outFileName {output.pjrn1}")
        shell("bamCoverage -p {threads} --bam {input.pjrn2} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pjgs} --outFileFormat {params.f} --outFileName {output.pjrn2}")
        shell("bamCoverage -p {threads} --bam {input.pmac} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --outFileFormat {params.f} --outFileName {output.pmac}")
        shell("bamCoverage -p {threads} --bam {input.pc} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} --outFileFormat {params.f} --outFileName {output.pc}")
        shell("bamCoverage -p {threads} --bam {input.cu} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --outFileFormat {params.f} --outFileName {output.cu}")
        shell("bamCoverage -p {threads} --bam {input.cap} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --outFileFormat {params.f} --outFileName {output.cap}")
        shell("bamCoverage -p {threads} --bam {input.con} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --outFileFormat {params.f} --outFileName {output.con}")
        shell("bamCoverage -p {threads} --bam {input.d21} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --outFileFormat {params.f} --outFileName {output.d21}")
        shell("bamCoverage -p {threads} --bam {input.d7} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --outFileFormat {params.f} --outFileName {output.d7}")
        shell("bamCoverage -p {threads} --bam {input.d0} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --outFileFormat {params.f} --outFileName {output.d0}")
 

# delete this after star run
rule rnaseq:
    input:
        pj="../../../pneumocystis_comparative_genomics/data/raw/Pjir/GCF_001477535.1_Pneu_jiro_RU7_V2_genomic",
        pjrn1r1="../../data/raw/rnaseq/Pjir/RN/Pj_RN110930_1.fq.gz",
        pjrn1r2="../../data/raw/rnaseq/Pjir/RN/Pj_RN110930_2.fq.gz",
        pjrn2r1="../../data/raw/rnaseq/Pjir/Rulung/Rulung_1.fq.gz",
        pjrn2r2="../../data/raw/rnaseq/Pjir/Rulung/Rulung_2.fq.gz",
        refpmac="../../data/external/refs/Pmac/Pneumocystis_macacae_NIAID.scaffolds",
        pmkr1="../../data/raw/rnaseq/Pmac/P2C/PMKRNA_1.fq.gz",
        pmkr2="../../data/raw/rnaseq/Pmac/P2C/PMKRNA_2.fq.gz",
#        ref="../../data/raw/Pmurina_G", # change this to point to Pneumo genomics
        pmref="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_genomic",
        cu1="../../data/raw/rnaseq/Pmur/A549_PC/A549_PC_1.fq.gz",
        cu2="../../data/raw/rnaseq/Pmur/A549_PC/A549_PC_2.fq.gz",
        cap1="../../data/raw/rnaseq/Pmur/Ca1/Caspo_2_1.fastq.gz",
        cap2="../../data/raw/rnaseq/Pmur/Ca1/Caspo_2_2.fastq.gz",
        con1="../../data/raw/rnaseq/Pmur/Co1/Control_10_1.fastq.gz",
        con2="../../data/raw/rnaseq/Pmur/Co1/Control_10_2.fastq.gz",
        d21r1="../../data/raw/rnaseq/Pmur/LS02192107Y/d21_r1.fq.gz",
        d21r2="../../data/raw/rnaseq/Pmur/LS02192107Y/d21_r2.fq.gz",
        d21contr1="../../data/raw/rnaseq/Pmur/LS02192107Y/d21_cont_r1.fq.gz",
        d21contr2="../../data/raw/rnaseq/Pmur/LS02192107Y/d21_cont_r2.fq.gz",
        d7r1="../../data/raw/rnaseq/Pmur/LS02192107Y/d7_r1.fq.gz",
        d7r2="../../data/raw/rnaseq/Pmur/LS02192107Y/d7_r2.fq.gz",
        d0r1="../../data/raw/rnaseq/Pmur/LS02192107Y/d0_r1.fq.gz",
        d0r2="../../data/raw/rnaseq/Pmur/LS02192107Y/d0_r2.fq.gz",
        pc="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_genomic",
        pcr1="../../data/raw/rnaseq/Pcar/Bd/Pc_70954_70955_70956_R1.fasta",
        pcr2="../../data/raw/rnaseq/Pcar/Bd/Pc_70954_70955_70956_R2.fasta",

    output:
#        cu=protected("../../data/processed/rnaseq/A549_PC.bam"),
#        cap=protected("../../data/processed/rnaseq/Caspo_2.bam"),
#        con=protected("../../data/processed/rnaseq/Control_10.bam"),
        d21=protected("../../data/processed/rnaseq/Pmur/LS02192107Y/Pm_d21_culture.bam"),
        d7=protected("../../data/processed/rnaseq/Pmur/LS02192107Y/Pm_d7_culture.bam"),
        d0=protected("../../data/processed/rnaseq/Pmur/LS02192107Y/Pm_d0_culture.bam"),
#        pmac=protected("../../data/processed/rnaseq/PmacP2C_RNA.bam"),
#        pjrn1=protected("../../data/processed/rnaseq/Pj_RN110930.bam"),
#        pjrn2=protected("../../data/processed/rnaseq/Pj_Rlung.bam"),
#        pc=protected("../../data/processed/rnaseq/Pcarinii.bam"),

    threads: 12

    run:
#        shell("bowtie2 -p {threads} -x {input.pmref} -1 {input.cu1} -2 {input.cu2} --no-unal | samtools view -bS - | samtools sort -@ {threads} -O bam -o {output.cu} -")
#        shell("samtools index {output.cu}")
#        shell("bowtie2 -p {threads} -x {input.pmref} -1 {input.cap1} -2 {input.cap2} --no-unal | samtools view -bS - | samtools sort -@ {threads} -O bam -o {output.cap}")
#        shell("samtools index {output.cap}")
#        shell("bowtie2 -p {threads} -x {input.pmref} -1 {input.con1} -2 {input.con2} --no-unal | samtools view -bS - | samtools sort -@ {threads} -O bam -o {output.con}")
#        shell("samtools index {output.con}")
        shell("bowtie2 -p {threads} -x {input.pmref} -1 {input.d21r1} -2 {input.d21r2} --no-unal | samtools view -bS - | samtools sort -@ {threads} -O bam -o {output.d21} -")
        shell("samtools index {output.d21}")
        shell("bowtie2 -p {threads} -x {input.pmref} -1 {input.d7r1} -2 {input.d7r2} --no-unal | samtools view -bS - | samtools sort -@ {threads} -O bam -o {output.d7} -")
        shell("samtools index {output.d7}")
        shell("bowtie2 -p {threads} -x {input.pmref} -1 {input.d0r1} -2 {input.d0r2} --no-unal | samtools view -bS - | samtools sort -@ {threads} -O bam -o {output.d0} -")
        shell("samtools index {output.d0}")
#        shell("bowtie2 -p {threads} -x {input.refpmac} -1 {input.pmkr1} -2 {input.pmkr2} --no-unal | samtools view -bS - | samtools sort -@ {threads} -O bam -o {output.pmac} -")
#        shell("bowtie2 -p {threads} -x {input.pj} -1 {input.pjrn1r1} -2 {input.pjrn1r2} --no-unal | samtools view -bS - | samtools sort -@ {threads} -O bam -o {output.pjrn1} -")
#        shell("bowtie2 -p {threads} -x {input.pj} -1 {input.pjrn2r1} -2 {input.pjrn2r2} --no-unal | samtools view -bS - | samtools sort -@ {threads} -O bam -o {output.pjrn2} -")
#        shell("bowtie2 -f -p {threads} -x {input.pc} -1 {input.pcr1} -2 {input.pcr2} --no-unal | samtools view -bS - | samtools sort -@ {threads} -O bam -o {output.pc} -")

# transcripts counts
rule kalisto_index:
    input:
#        hg="/hpcdata/dcr_cc/Ousmane_Data/DATA/genomesDB/human/GCF_000001405.35_GRCh38.p9_rna.fna",
#        ms="/hpcdata/dcr_cc/Ousmane_Data/DATA/genomesDB/mouse/GCF_000001635.26_GRCm38.p6_rna.fna",
        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_rna.fna",
        pc="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_rna.fna",
    output:
#        hg="/hpcdata/dcr_cc/Ousmane_Data/DATA/genomesDB/human/GCF_000001405.35_GRCh38.p9_rna.idx",
#        ms="/hpcdata/dcr_cc/Ousmane_Data/DATA/genomesDB/mouse/GCF_000001635.26_GRCm38.p6_rna.idx",
        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_rna.idx",
        pc="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_rna.idx",
#        mix="../../data/processed/rnaseq/kallisto/hg_ms_pm_mix_rna.fna",
#        mixd="../../data/processed/rnaseq/kallisto/hg_ms_pm_mix_rna.idx"
    run:
       shell("kallisto index -i {output.pm} {input.pm}")  
       shell("kallisto index -i {output.pc} {input.pc}") 
#       shell("cat {input.hg} {input.ms} {input.pm} > {output.mix}")
#       shell("kallisto index -i {output.mixd} {output.mix}") 

rule kallisto_quant_pc:
    input:
        idx=rules.kalisto_index.output.pc,
        gtf="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_genomic.gtf",
        chrs="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_genomic.chrom.sizes",
        r1="../../data/raw/rnaseq/Pcar/Bd/Pc_70954_70955_70956_R1.fq.gz",
        r2="../../data/raw/rnaseq/Pcar/Bd/Pc_70954_70955_70956_R2.fq.gz",
    output:
        pc=directory("../../data/processed/rnaseq/kallisto/pc/Bd")
    threads: 12
    params:
        b="100"
    run:
        shell("kallisto quant -i {input.idx} -o {output.pc} -b {params.b} -t {threads} --genomebam --gtf {input.gtf} --chromosomes {input.chrs} {input.r1} {input.r2}")

rule kallisto_quant:
    input:
        pmidx=rules.kalisto_index.output.pm,
        pmgtf="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_genomic.gtf",
        pmchrs="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_genomic.chrom.sizes",
#        idx=rules.kalisto_index.output.mixd,
        d21r1="../../data/raw/rnaseq/Pmur/LS02192107Y/d21_r1.fq.gz",
        d21r2="../../data/raw/rnaseq/Pmur/LS02192107Y/d21_r2.fq.gz",
        d21contr1="../../data/raw/rnaseq/Pmur/LS02192107Y/d21_cont_r1.fq.gz",
        d21contr2="../../data/raw/rnaseq/Pmur/LS02192107Y/d21_cont_r2.fq.gz",
        d7r1="../../data/raw/rnaseq/Pmur/LS02192107Y/d7_r1.fq.gz",
        d7r2="../../data/raw/rnaseq/Pmur/LS02192107Y/d7_r2.fq.gz",
        d0r1="../../data/raw/rnaseq/Pmur/LS02192107Y/d0_r1.fq.gz",
        d0r2="../../data/raw/rnaseq/Pmur/LS02192107Y/d0_r2.fq.gz",
        
        cu1="../../data/raw/rnaseq/Pmur/A549_PC/A549_PC_1.fq.gz",
        cu2="../../data/raw/rnaseq/Pmur/A549_PC/A549_PC_2.fq.gz",
        cap1="../../data/raw/rnaseq/Pmur/Ca1/Caspo_2_1.fastq.gz",
        cap2="../../data/raw/rnaseq/Pmur/Ca1/Caspo_2_2.fastq.gz",
        con1="../../data/raw/rnaseq/Pmur/Co1/Control_10_1.fastq.gz",
        con2="../../data/raw/rnaseq/Pmur/Co1/Control_10_2.fastq.gz",

    output:
        pmd0=directory("../../data/processed/rnaseq/kallisto/Pmur/LS02192107Y/d0"),
        pmd7=directory("../../data/processed/rnaseq/kallisto/Pmur/LS02192107Y/d7"),
        pmd21=directory("../../data/processed/rnaseq/kallisto/Pmur/LS02192107Y/d21"),
        pmd21c=directory("../../data/processed/rnaseq/kallisto/Pmur/LS02192107Y/d21cont"),
        cu=directory("../../data/processed/rnaseq/kallisto/Pmur/A549_PC/A549_PC"),
        cap=directory("../../data/processed/rnaseq/kallisto/Pmur/Ca1/Caspo_2"),
        con=directory("../../data/processed/rnaseq/kallisto/Pmur/Co1/Control_10"),
#        mixd0=directory("../../data/processed/rnaseq/kallisto/mix/LS02192107Y/hs_ms_pm/d0"),
#        mixd7=directory("../../data/processed/rnaseq/kallisto/mix/LS02192107Y/hs_ms_pm/d7"),
#        mixd21=directory("../../data/processed/rnaseq/kallisto/mix/LS02192107Y/hs_ms_pm/d21"),
#        mixd21c=directory("../../data/processed/rnaseq/kallisto/mix/LS02192107Y/hs_ms_pm/d21c"),
    threads: 12

    params:
        b="100"
    run:
        shell("kallisto quant -i {input.pmidx} -o {output.pmd0} -b {params.b} -t {threads} --genomebam --gtf {input.pmgtf} --chromosomes {input.pmchrs} {input.d0r1} {input.d0r2}")
        shell("kallisto quant -i {input.pmidx} -o {output.pmd7} -b {params.b} -t {threads} --genomebam --gtf {input.pmgtf} --chromosomes {input.pmchrs} {input.d7r1} {input.d7r2}")
        shell("kallisto quant -i {input.pmidx} -o {output.pmd21} -b {params.b} -t {threads} --genomebam --gtf {input.pmgtf} --chromosomes {input.pmchrs} {input.d21r1} {input.d21r2}")
        shell("kallisto quant -i {input.pmidx} -o {output.pmd21c} -b {params.b} -t {threads} --genomebam --gtf {input.pmgtf} --chromosomes {input.pmchrs} {input.d21contr1} {input.d21contr2}")
        shell("kallisto quant -i {input.pmidx} -o {output.cu} -b {params.b} -t {threads} --genomebam --gtf {input.pmgtf} --chromosomes {input.pmchrs} {input.cu1} {input.cu2}")
        shell("kallisto quant -i {input.pmidx} -o {output.cap} -b {params.b} -t {threads} --genomebam --gtf {input.pmgtf} --chromosomes {input.pmchrs} {input.cap1} {input.cap2}")
        shell("kallisto quant -i {input.pmidx} -o {output.con} -b {params.b} -t {threads} --genomebam --gtf {input.pmgtf} --chromosomes {input.pmchrs} {input.con1} {input.con2}")
#        shell("kallisto quant -i {input.idx} -o  {output.mixd0} -b {params.b} -t {threads} {input.d0r1} {input.d0r2}")
#        shell("kallisto quant -i {input.idx} -o  {output.mixd7} -b {params.b} -t {threads} {input.d7r1} {input.d7r2}")
#        shell("kallisto quant -i {input.idx} -o  {output.mixd21} -b {params.b} -t {threads} {input.d21r1} {input.d21r2}")
#        shell("kallisto quant -i {input.idx} -o  {output.mixd21c} -b {params.b} -t {threads} {input.d21contr1} {input.d21contr2}")

rule rbh:
    input:
        hg="/hpcdata/dcr_cc/Ousmane_Data/DATA/genomesDB/human/GCF_000001405.35_GRCh38.p9_rna.fna",
        ms="/hpcdata/dcr_cc/Ousmane_Data/DATA/genomesDB/mouse/GCF_000001635.26_GRCm38.p6_rna.fna",
        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_rna.fna",
    output:
        dir=directory("../../data/processed/hs_ms_pm/blast_files"),
        o="../../data/processed/hs_ms_pm/hs_ms_pm.rbh"
    params: e="1e-10", p="blastn"
    threads: 12
    run:
        shell("mkdir {output.dir}")
        shell("perl ~/utils/proteinortho_v2.3.0.pl {input.hg} {input.ms} {input.pm} -p={params.p} -e={params.e} -dir={output.dir} -a={threads} > {output.o}")
         
rule kallisto_aggregate:
    input:
        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_rna.fna",
        d0="../../data/processed/rnaseq/kallisto/Pmur/LS02192107Y/d0/abundance.tsv",
        d7="../../data/processed/rnaseq/kallisto/Pmur/LS02192107Y/d7/abundance.tsv",
        d21="../../data/processed/rnaseq/kallisto/Pmur/LS02192107Y/d21/abundance.tsv",
        d21c="../../data/processed/rnaseq/kallisto/Pmur/LS02192107Y/d21cont/abundance.tsv",
        cu="../../data/processed/rnaseq/kallisto/Pmur/A549_PC/A549_PC/abundance.tsv",
        cap="../../data/processed/rnaseq/kallisto/Pmur/Ca1/Caspo_2/abundance.tsv",
        con="../../data/processed/rnaseq/kallisto/Pmur/Co1/Control_10/abundance.tsv",
        hg="/hpcdata/dcr_cc/Ousmane_Data/DATA/genomesDB/human/GCF_000001405.35_GRCh38.p9_rna.fna",
        ms="/hpcdata/dcr_cc/Ousmane_Data/DATA/genomesDB/mouse/GCF_000001635.26_GRCm38.p6_rna.fna",
#        rbh=rules.rbh.output.o,
        mixd0="../../data/processed/rnaseq/kallisto/mix/LS02192107Y/hs_ms_pm/d0/abundance.tsv",
        mixd7="../../data/processed/rnaseq/kallisto/mix/LS02192107Y/hs_ms_pm/d7/abundance.tsv",
        mixd21="../../data/processed/rnaseq/kallisto/mix/LS02192107Y/hs_ms_pm/d21/abundance.tsv",
        mixd21c="../../data/processed/rnaseq/kallisto/mix/LS02192107Y/hs_ms_pm/d21c/abundance.tsv"

    output:
        pmBin="../../data/processed/rnaseq/kallisto/Pmur/rna_seq_aggreg.binary.csv",
        pmVal="../../data/processed/rnaseq/kallisto/Pmur/rna_seq_aggreg.tpm.csv"
#        pm="../../data/processed/rnaseq/kallisto/Pmur/LS02192107Y/LS02192107Y_aggreg_raw.csv",
#        orth="../../data/processed/rnaseq/kallisto/Pmur/LS02192107Y/LS02192107Y_ortholog.csv",
#        hg="../../data/processed/rnaseq/kallisto/hg/LS02192107Y/hg_LS02192107Y_aggreg_raw.csv",
#        ms="../../data/processed/rnaseq/kallisto/ms/LS02192107Y/ms_LS02192107Y_aggreg_raw.csv",
    params:
        cf="2"
    run:
        shell("perl ../scripts/kallisto_aggregate.pl  {input.cu} {input.d0} {input.d7} {input.d21} {input.d21c} {input.cap} {input.con} {input.pm} --cutoff {params.cf} --binary True > {output.pmBin}")
        shell("perl ../scripts/kallisto_aggregate.pl  {input.cu} {input.d0} {input.d7} {input.d21} {input.d21c} {input.cap} {input.con} {input.pm} --cutoff {params.cf} --binary False > {output.pmVal}")
#        shell("perl ../scripts/kallisto_aggregate.pl {input.mixd0} {input.mixd7} {input.mixd21} {input.mixd21c} {input.hg} > {output.hg}")
#        shell("perl ../scripts/kallisto_aggregate.pl {input.mixd0} {input.mixd7} {input.mixd21} {input.mixd21c} {input.ms} > {output.ms}")
#        shell("perl ../scripts/kallisto_aggregate_ortho.pl {input.mixd0} {input.mixd7} {input.mixd21} {input.mixd21c} {input.rbh} > {output.orth}")

#rule bamCoverage:
#    input:
#        cu=rules.rnaseq.output.cu,
#        cap=rules.rnaseq.output.cap,
#        con=rules.rnaseq.output.con,
#        pmac=rules.rnaseq.output.pmac,
#        pjrn1=rules.rnaseq.output.pjrn1,
#        pjrn2=rules.rnaseq.output.pjrn2,
#        pc=rules.rnaseq.output.pc

#    threads: 12
#    output:
#        cu="../../data/processed/rnaseq/A549_PC.coverage.bedgraph",
#        cap="../../data/processed/rnaseq/Caspo_2.coverage.bedgraph",
#        con="../../data/processed/rnaseq/Control_10.coverage.bedgraph",
#        pmac="../../data/processed/rnaseq/PmacP2C_RNA.coverage.bedgraph",
#        pjrn1="../../data/processed/rnaseq/Pj_RN110930.coverage.bedgraph",
#        pjrn2="../../data/processed/rnaseq/Pj_Rlung.coverage.bedgraph",
#        pc="../../data/processed/rnaseq/Pcarinii.coverage.bedgraph"
#    params:
#        "bedgraph --normalizeUsingRPKM --ignoreDuplicates"
#    run:
#        shell("bamCoverage -p {threads} -b {input.cu} -o {output.cu} -of {params}")
#        shell("bamCoverage -p {threads} -b {input.cap} -o {output.cap} -of {params}")
#        shell("bamCoverage -p {threads} -b {input.con} -o {output.con} -of {params}")
#        shell("bamCoverage -p {threads} -b {input.pmac} -o {output.pmac} -of {params}")
#        shell("bamCoverage -p {threads} -b {input.pjrn1} -o {output.pjrn1} -of {params}")
#        shell("bamCoverage -p {threads} -b {input.pjrn2} -o {output.pjrn2} -of {params}")
#        shell("bamCoverage -p {threads} -b {input.pc} -o {output.pc} -of {params}")

        
