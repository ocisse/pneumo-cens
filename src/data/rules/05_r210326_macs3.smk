####
include: "02_r210326_mapping.smk"

# want to see enrichment in previously identified cens
rule enrichment:
   input:
        cccp="../../data/processed/macs2/191010/broad/Pmur_CC_CP/Pmur_CC_CP_peaks.broadPeak.mc.bed",
        pmacaig="../../data/processed/macs2/201103/narrow/Pmac_A_IG/Pmac_A_IG_peaks.narrowPeak.mc.bed",
#        pmd0a=rules.picard.input.pmd0a,
#        pmd0h=rules.picard.input.pmd0h,
#        pmd7a=rules.picard.input.pmd7a,
#        pmd7h=rules.picard.input.pmd7h,
#        pmd14a=rules.picard.input.pmd14a,
#        pmd14h=rules.picard.input.pmd14h,
#        za=rules.picard.input.za, # no previously defined regions
#        zh=rules.picard.input.zh,
#        p3ca=rules.picard.input.p3ca,
#        p3ch=rules.picard.input.p3ch,
#        p2ca=rules.picard.input.p2ca,
#        p2ch=rules.picard.input.p2ch,
#        don't to recompute everything
        pmd0a="../../data/processed/mapping/210326/Pm_Inc_A.dr.bam",
        pmd0h="../../data/processed/mapping/210326/Pm_Inc_H3.dr.bam",
        pmd7a="../../data/processed/mapping/210326/Pm_D7_A.dr.bam",
        pmd7h="../../data/processed/mapping/210326/Pm_D7_H3.dr.bam",
        pmd14a="../../data/processed/mapping/210326/Pm_D14_A.dr.bam",
        pmd14h="../../data/processed/mapping/210326/Pm_D14_H3.dr.bam",
        p3ca="../../data/processed/mapping/210326/PmacP3C_A.dr.bam",
        p3ch="../../data/processed/mapping/210326/PmacP3C_H3.dr.bam",
        za="../../data/processed/mapping/210326/PjZA_A.dr.bam",
        zh="../../data/processed/mapping/210326/PjZA_H.dr.bam",
        p2ca="../../data/processed/mapping/210326/PmacP2C_A.dr.bam",
        p2ch="../../data/processed/mapping/210326/PmacP2C_H3.dr.bam",
        p2ca2="../../data/processed/mapping/201103/Pmac-A.dr.bam", # just for comparison relative to the old run
        p2cc="../../data/processed/mapping/201103/Pmac-C.dr.bam" # just for comparison relative to the old run

   output:
        pmd0ah="../../data/processed/macs2/210326/Pm_Inc_A_H3.enrichment.svg",
        pmd7ah="../../data/processed/macs2/210326/Pm_D7_A_H3.enrichment.png",
        pmd14ah="../../data/processed/macs2/210326/Pm_D14_A_H3.enrichment.png",
#        zah="../../data/processed/macs2/210326/PjZA_A_H3.enrichment.png",
        p3cah="../../data/processed/macs2/210326/PmacP3C_A_H.enrichment.png",
        p2cah="../../data/processed/macs2/210326/PmacP2C_A_H3.enrichment.png",
        p2ca2="../../data/processed/macs2/210326/Pmac-A_r201103_vs_H3.enrichment.png",
        p2cc="../../data/processed/macs2/210326/Pmac-C_r201103_vs_H3.enrichment.png"

   threads: 12
   params: col="blue red", f="svg"
   run:
        shell("plotEnrichment -p {threads} -b {input.pmd0a} {input.pmd0h} --BED {input.cccp} -o {output.pmd0ah} --plotFileFormat {params.f} --colors {params.col} ")
        shell("plotEnrichment -p {threads} -b {input.pmd7a} {input.pmd7h} --BED {input.cccp} -o {output.pmd7ah}")
        shell("plotEnrichment -p {threads} -b {input.pmd14a} {input.pmd14h} --BED {input.cccp} -o {output.pmd14ah}")
        shell("plotEnrichment -p {threads} -b {input.p3ca} {input.p3ch} --BED {input.pmacaig} -o {output.p3cah}")
        shell("plotEnrichment -p {threads} -b {input.p2ca} {input.p2ch} --BED {input.pmacaig} -o {output.p2cah}")
        shell("plotEnrichment -p {threads} -b {input.p2ca2} {input.p2ch} --BED {input.pmacaig} -o {output.p2ca2}")
        shell("plotEnrichment -p {threads} -b {input.p2cc} {input.p2ch} --BED {input.pmacaig} -o {output.p2cc}")

# no need for Pm
rule callbroad:
    input:
        za="../../data/processed/mapping/210326/PjZA_A.dr.bam",
        zh="../../data/processed/mapping/210326/PjZA_H.dr.bam",
        p3ca="../../data/processed/mapping/210326/PmacP3C_A.dr.bam",
        p3ch="../../data/processed/mapping/210326/PmacP3C_H3.dr.bam",
        p2ca="../../data/processed/mapping/210326/PmacP2C_A.dr.bam",
        p2ch="../../data/processed/mapping/210326/PmacP2C_H3.dr.bam",
    output:
        zah=directory("../../data/processed/macs2/210326/broad/PjZA_A_H3"),
#        p3cah=directory("../../data/processed/macs2/210326/broad/PmacP3C_A_H"),
#        p2cah=directory("../../data/processed/macs2/210326/broad/PmacP2C_A_H")
    threads: 12
    params:
        p1="--broad --broad-cutoff 0.1 -f BAMPE -g 7.4e6 --SPMR --qvalue 0.05 --keep-dup all",
        p2="--fe-cutoff 1.2",
        p3="--fe-cutoff 2.4",
    run:
        shell("macs3 callpeak -t {input.za} -c {input.zh} --outdir {output.zah} {params.p1} {params.p3} -n PjZA_A_H3")
        shell("macs3 callpeak -t {input.p3ca} -c {input.p3ch} --outdir {output.p3cah} {params.p1}  {params.p2} -n PmacP3C_A_H")
        shell("macs3 callpeak -t {input.p2ca} -c {input.p2ch} --outdir {output.p2cah} {params.p1}  {params.p2} -n PmacP2C_A_H")
# trying to see if there is enrichment outside the regions flagged in past Chip-Seq exps
rule enrich2:
    input:
        p3ca="../../data/processed/mapping/210326/PmacP3C_A.dr.bam",
        p3ch="../../data/processed/mapping/210326/PmacP3C_H3.dr.bam",
        p3cpeaks="../../data/processed/macs2/210326/broad/PmacP3C_A_H/PmacP3C_A_H_peaks.gappedPeak", # BED12 format
        za="../../data/processed/mapping/210326/PjZA_A.dr.bam",
        zh="../../data/processed/mapping/210326/PjZA_H.dr.bam",
        zpeaks="../../data/processed/macs2/210326/broad/PjZA_A_H3/PjZA_A_H3_peaks.gappedPeak",
        zpk2="../../data/processed/macs2/210326/broad/PjZA_A_H3/PjZA_A_H3_peaks.gappedPeak.MC",
        p2ca="../../data/processed/mapping/210326/PmacP2C_A.dr.bam",
        p2ch="../../data/processed/mapping/210326/PmacP2C_H3.dr.bam",
        p2cpeaks="../../data/processed/macs2/210326/broad/PmacP2C_A_H/PmacP2C_A_H_peaks.gappedPeak",

    output:
        zah="../../data/processed/macs2/210326/broad/PjZA_A_H3.enrichment.png",
        zah2="../../data/processed/macs2/210326/broad/PjZA_A_H3_MC.enrichment.png",
        p3cah="../../data/processed/macs2/210326/broad/PmacP3C_A_H.enrichment.png",
        p2cah="../../data/processed/macs2/210326/broad/PmacP2C_A_H3.enrichment.png",

    threads: 12

    run:
        shell("plotEnrichment -p {threads} -b {input.za} {input.zh} --BED {input.zpeaks} -o {output.zah}") # there something
        shell("plotEnrichment -p {threads} -b {input.za} {input.zh} --BED {input.zpk2} -o {output.zah2}") 
        shell("plotEnrichment -p {threads} -b {input.p3ca} {input.p3ch} --BED {input.p3cpeaks} -o {output.p3cah}")
        shell("plotEnrichment -p {threads} -b {input.p2ca} {input.p2ch} --BED {input.p2cpeaks} -o {output.p2cah}")

# manually review Pj data
# ../../data/processed/macs2/210326/broad/PjZA_A_H3/PjZA_A_H3_peaks.gappedPeak.MC  # original
# ../../data/processed/macs2/210326/broad/PjZA_A_H3/PjZA_A_H3_peaks.gappedPeak.MC2 # adjusted in IGV (precise peak)
# ../../data/processed/macs2/210326/broad/PjZA_A_H3/PjZA_A_H3_peaks.gappedPeak.MC2_extended # extended a bit more in igv
rule enrich_pj:
    input:
        za="../../data/processed/mapping/210326/PjZA_A.dr.bam",
        zh="../../data/processed/mapping/210326/PjZA_H.dr.bam",
        pjc="../../data/processed/mapping/201103/Pj-C.dr.bam", # fingerplot is ok
        pjpc="../../data/processed/mapping/201103/Pj-PC.dr.bam", # fg is ok
        pja="../../data/processed/mapping/201103/Pj-A.dr.bam", # fingerplot is bad
        pjpa="../../data/processed/mapping/201103/Pj-PA.dr.bam", # fingerplot is bad
        pk="../../data/processed/macs2/210326/broad/PjZA_A_H3/PjZA_A_H3_peaks.gappedPeak.MC2"
    output:
        "../../data/processed/macs2/210326/broad/PjZA_A_H3_peaks.gappedPeak.MC2.enrichment.png"
    threads: 12
    shell:
        "plotEnrichment -p {threads} -b {input.za} {input.zh} {input.pjc} {input.pjpc} {input.pja} {input.pjpa}"
        " --BED {input.pk} -o {output}"
