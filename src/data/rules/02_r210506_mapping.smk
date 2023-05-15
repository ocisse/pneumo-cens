
####
##

rule map210506:
    input:
        pj="../../../pneumocystis_comparative_genomics/data/raw/Pjir/GCF_001477535.1_Pneu_jiro_RU7_V2_genomic.fna",
        pmac="../../../pneumocystis_comparative_genomics/data/processed/Pmac/Funannotate/PMAC_NAID_v2/predict_results/Pneumocystis_macacae_NIAID.scaffolds.fa",
        pc="../../../pneumocystis_comparative_genomics/data/raw/Pcar/GCF_001477545.1_Pneu_cari_B80_V3_genomic.fna",
#        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/GCF_000349005.2_Pneumo_murina_B123_V4_genomic.fna",
        pm="../../../pneumocystis_comparative_genomics/data/raw/Pmur/v1_version_ncbi/GCF_000349005.1_Pneumo_murina_B123_V2_genomic.fasta",
        pcnr2="../../data/processed/host_removed/210506/PcN.2.fq.gz",
        pcnr1="../../data/processed/host_removed/210506/PcN.1.fq.gz",
        pchr2="../../data/processed/host_removed/210506/PcH.2.fq.gz",
        pchr1="../../data/processed/host_removed/210506/PcH.1.fq.gz",
        pccr2="../../data/processed/host_removed/210506/PcC.2.fq.gz",
        pccr1="../../data/processed/host_removed/210506/PcC.1.fq.gz",
        pcar2="../../data/processed/host_removed/210506/PcA.2.fq.gz",
        pcar1="../../data/processed/host_removed/210506/PcA.1.fq.gz",
        p3cnr2="../../data/processed/host_removed/210506/P3CN.2.fq.gz",
        p3cnr1="../../data/processed/host_removed/210506/P3CN.1.fq.gz",
        p3ccr2="../../data/processed/host_removed/210506/P3CC.2.fq.gz",
        p3ccr1="../../data/processed/host_removed/210506/P3CC.1.fq.gz",
        p2crgr2="../../data/processed/host_removed/210506/P2CR.2.fq.gz",
        p2crgr1="../../data/processed/host_removed/210506/P2CR.1.fq.gz",
        p2cnr2="../../data/processed/host_removed/210506/P2CN.2.fq.gz",
        p2cnr1="../../data/processed/host_removed/210506/P2CN.1.fq.gz",
        spnr2="../../data/processed/host_removed/210506/SpN.2.fq.gz",
        spnr1="../../data/processed/host_removed/210506/SpN.1.fq.gz",
        sphr2="../../data/processed/host_removed/210506/SpH.2.fq.gz",
        sphr1="../../data/processed/host_removed/210506/SpH.1.fq.gz",
        spcr2="../../data/processed/host_removed/210506/SpC.2.fq.gz",
        spcr1="../../data/processed/host_removed/210506/SpC.1.fq.gz",
        spar2="../../data/processed/host_removed/210506/SpA.2.fq.gz",
        spar1="../../data/processed/host_removed/210506/SpA.1.fq.gz",

 
    threads:  12

#    conda:
#        "envs/meta.yaml"

    output:
        pcn=temp("../../data/processed/mapping/210506/PcN.bam"),
        pch=temp("../../data/processed/mapping/210506/PcH.bam"),
        pcc=temp("../../data/processed/mapping/210506/PcC.bam"),
        pca=temp("../../data/processed/mapping/210506/PcA.bam"),
        p3cn=temp("../../data/processed/mapping/210506/P3CN.bam"),
        p3cc=temp("../../data/processed/mapping/210506/P3CC.bam"),
        p2crg=temp("../../data/processed/mapping/210506/P2CR.bam"),
        p2cn=temp("../../data/processed/mapping/210506/P2CN.bam"),
        spn=temp("../../data/processed/mapping/210506/SpN.bam"),
        sph=temp("../../data/processed/mapping/210506/SpH.bam"),
        spc=temp("../../data/processed/mapping/210506/SpC.bam"),
        spa=temp("../../data/processed/mapping/210506/SpA.bam"),

    run:
        shell("bwa mem -M -t {threads} {input.pc} {input.pcnr1} {input.pcnr2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.pcn}")
        shell("bwa mem -M -t {threads} {input.pc} {input.pchr1} {input.pchr2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.pch}")
        shell("bwa mem -M -t {threads} {input.pc} {input.pccr1} {input.pccr2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.pcc}")
        shell("bwa mem -M -t {threads} {input.pc} {input.pcar1} {input.pcar2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.pca}")        
        shell("bwa mem -M -t {threads} {input.pmac} {input.p3cnr1} {input.p3cnr2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.p3cn}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.p3ccr1} {input.p3ccr2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.p3cc}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.p2crgr1} {input.p2crgr2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.p2crg}")
##        shell("bwa mem -M -t {threads} {input.pmac} {input.p2cnr1} {input.p2cnr2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.p2cn}")
        shell("bwa mem -M -t {threads} {input.pmac} {input.p2cnr1} {input.p2cnr2} | samtools view -F 4 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.p2cn}")
        shell("bwa mem -M -t {threads} {input.pj} {input.spnr1} {input.spnr2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.spn}")
        shell("bwa mem -M -t {threads} {input.pj} {input.sphr1} {input.sphr2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.sph}")
        shell("bwa mem -M -t {threads} {input.pj} {input.spcr1} {input.spcr2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.spc}")
        shell("bwa mem -M -t {threads} {input.pj} {input.spar1} {input.spar2} | samtools view -f 3 -F 4 -F 8 -F 256 -F 2048 -q 30 -bS - | samtools sort -@ {threads} -O bam -o {output.spa}")
        
rule mark_dup210506:
    input:
        pcn=rules.map210506.output.pcn,
        pch=rules.map210506.output.pch,
        pcc=rules.map210506.output.pcc,
        pca=rules.map210506.output.pca,
        p3cn=rules.map210506.output.p3cn,
        p3cc=rules.map210506.output.p3cc,
        p2crg=rules.map210506.output.p2crg,
        p2cn=rules.map210506.output.p2cn,
        spn=rules.map210506.output.spn,
        sph=rules.map210506.output.sph,
        spc=rules.map210506.output.spc,
        spa=rules.map210506.output.spa,

#    conda:
#        "envs/meta.yaml"
    log:
        "../../data/processed/mapping/logs/picar_210506.log"
    output:
        pcn=protected("../../data/processed/mapping/210506/PcN.dr.bam"),
        pch=protected("../../data/processed/mapping/210506/PcH.dr.bam"),
        pcc=protected("../../data/processed/mapping/210506/PcC.dr.bam"),
        pca=protected("../../data/processed/mapping/210506/PcA.dr.bam"),
        p3cn=protected("../../data/processed/mapping/210506/P3CN.dr.bam"),
        p3cc=protected("../../data/processed/mapping/210506/P3CC.dr.bam"),
        p2crg=protected("../../data/processed/mapping/210506/P2CR.dr.bam"),
        p2cn=protected("../../data/processed/mapping/210506/P2CN.dr.bam"),
        spn=protected("../../data/processed/mapping/210506/SpN.dr.bam"),
        sph=protected("../../data/processed/mapping/210506/SpH.dr.bam"),
        spc=protected("../../data/processed/mapping/210506/SpC.dr.bam"),
        spa=protected("../../data/processed/mapping/210506/SpA.dr.bam"),

    run:
        shell("picard MarkDuplicates I={input.pcn}  O={output.pcn} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.pch}  O={output.pch} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.pcc}  O={output.pcc} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.pca}  O={output.pca} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.p3cn}  O={output.p3cn} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.p3cc}  O={output.p3cc} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.p2crg}  O={output.p2crg} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.p2cn}  O={output.p2cn} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.spn}  O={output.spn} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.sph}  O={output.sph} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.spc}  O={output.spc} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")
        shell("picard MarkDuplicates I={input.spa}  O={output.spa} METRICS_FILE={log} REMOVE_DUPLICATES=TRUE ASSUME_SORTED=TRUE")

rule coverage_210506:
    input:
        pcn=rules.mark_dup210506.output.pcn,
        pch=rules.mark_dup210506.output.pch,
        pcc=rules.mark_dup210506.output.pcc,
        pca=rules.mark_dup210506.output.pca,
        
    params:
        b="50", norm="BPM",  pmgs="7451359", pcgs="7661456", f="bigwig"
    output:
        pcn="../../data/processed/mapping/210506/PcN.dr.bw",
        pch="../../data/processed/mapping/210506/PcH.dr.bw",
        pcc="../../data/processed/mapping/210506/PcC.dr.bw",
        pca="../../data/processed/mapping/210506/PcA.dr.bw",
    
    threads: 6
    run:
        shell("bamCoverage -p {threads} -b {input.pcn} -o {output.pcn} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.pch} -o {output.pch} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.pcc} -o {output.pcc} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.pca} -o {output.pca} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pcgs} -of {params.f} --centerReads")

