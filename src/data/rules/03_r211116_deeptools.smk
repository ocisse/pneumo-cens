####
## need to index the bam first -- look at gatk rules but for nwo
# samtools index -b ../../data/processed/mapping/201103/Pc-A.dr.bam
# cd ~/projects/Centromeres/data/processed/mapping/201103
# ls *.dr.bam  | while read f; do samtools index -b $f;done

include: "02_r211116_mapping.smk"

# module load samtools ; conda version is buggy
# 
rule index211116:
   input:
        s2=rules.mark_dup211116.output.s2,
        s3=rules.mark_dup211116.output.s3,
        s4=rules.mark_dup211116.output.s4,
        s5=rules.mark_dup211116.output.s5,
        s6=rules.mark_dup211116.output.s6,
        s7=rules.mark_dup211116.output.s7,
        s8=rules.mark_dup211116.output.s8,
        s9=rules.mark_dup211116.output.s9,
        s10=rules.mark_dup211116.output.s10,
        s11=rules.mark_dup211116.output.s11,
        s12=rules.mark_dup211116.output.s12, 
   run:
        shell("samtools index {input.s1}") 
        shell("samtools index {input.s2}")
        shell("samtools index {input.s3}")
        shell("samtools index {input.s4}")
        shell("samtools index {input.s5}")
        shell("samtools index {input.s6}")
        shell("samtools index {input.s7}")
        shell("samtools index {input.s8}")
        shell("samtools index {input.s9}")
        shell("samtools index {input.s10}")
        shell("samtools index {input.s11}")
        shell("samtools index {input.s12}")
        
rule bamCompare211116:
   input:
        s2=rules.mark_dup211116.output.s2,
        s3=rules.mark_dup211116.output.s3,
        s4=rules.mark_dup211116.output.s4,
        s5=rules.mark_dup211116.output.s5,
        s6=rules.mark_dup211116.output.s6,
        s7=rules.mark_dup211116.output.s7,
        s8=rules.mark_dup211116.output.s8,
        s9=rules.mark_dup211116.output.s9,
        s10=rules.mark_dup211116.output.s10,
        s11=rules.mark_dup211116.output.s11,
        s12=rules.mark_dup211116.output.s12,

   output:
        s2s3="../../data/processed/deeptools/211116/S2_S3_log2ratio.bw",
        s2s6="../../data/processed/deeptools/211116/S2_S6_log2ratio.bw",
        s4s5="../../data/processed/deeptools/211116/S4_S5_log2ratio.bw",
        s4s6="../../data/processed/deeptools/211116/S4_S6_log2ratio.bw",
        s7s6="../../data/processed/deeptools/211116/S7_S6_log2ratio.bw",
        s8s6="../../data/processed/deeptools/211116/S8_S6_log2ratio.bw",
        s10s12="../../data/processed/deeptools/211116/S10_S12_log2ratio.bw",
        s11s12="../../data/processed/deeptools/211116/S11_S12_log2ratio.bw",

   params: of="bigwig", bs="10",  flg="64", n="None", pmgs="7451359", pcgs="7661456", pmacgs="8274841"
   threads: 6 
   run:
        shell("bamCompare -p {threads} -b1 {input.s2} -b2 {input.s3} -o {output.s2s3}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s2} -b2 {input.s6} -o {output.s2s6}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s4} -b2 {input.s5} -o {output.s4s5}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s4} -b2 {input.s6} -o {output.s4s6}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s7} -b2 {input.s6} -o {output.s7s6}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s8} -b2 {input.s6} -o {output.s8s6}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s10} -b2 {input.s12} -o {output.s10s12}  -bs {params.bs} --effectiveGenomeSize {params.pcgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s11} -b2 {input.s12} -o {output.s11s12}  -bs {params.bs} --effectiveGenomeSize {params.pcgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")


rule plotFingerprint211116:
   input:
        s2=rules.index211116.input.s2,
        s3=rules.index211116.input.s3,
        s4=rules.index211116.input.s4,
        s5=rules.index211116.input.s5,
        s6=rules.index211116.input.s6,
        s7=rules.index211116.input.s7,
        s8=rules.index211116.input.s8,
        s9=rules.index211116.input.s9,
        s10=rules.index211116.input.s10,
        s11=rules.index211116.input.s11,
        s12=rules.index211116.input.s12,
   output:
        s2s3="../../data/processed/deeptools/211116/S2_S3_fingerprints.png",
        s2s6="../../data/processed/deeptools/211116/S2_S6_fingerprints.png",
        s4s5="../../data/processed/deeptools/211116/S4_S5_fingerprints.png",
        s4s6="../../data/processed/deeptools/211116/S4_S6_fingerprints.png",
        s7s6="../../data/processed/deeptools/211116/S7_S6_fingerprints.png",
        s8s6="../../data/processed/deeptools/211116/S8_S6_fingerprints.png",
        s10s12="../../data/processed/deeptools/211116/S10_S12_fingerprints.png",
        s11s12="../../data/processed/deeptools/211116/S11_S12_fingerprints.png",

   params: q="30", t="\"Fingerprints of different samples\""
    
    threads: 12
    
    run:
        shell("plotFingerprint -b {input.s2} {input.s3} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s2s3} -p {threads}")
        shell("plotFingerprint -b {input.s2} {input.s6} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s2s6} -p {threads}")
        shell("plotFingerprint -b {input.s4} {input.s5} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s4s5} -p {threads}")
        shell("plotFingerprint -b {input.s4} {input.s6} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s4s6} -p {threads}")
        shell("plotFingerprint -b {input.s7} {input.s6} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s7s6} -p {threads}")
        shell("plotFingerprint -b {input.s8} {input.s6} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s8s6} -p {threads}")
        shell("plotFingerprint -b {input.s10} {input.s12} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s10s12} -p {threads}")
        shell("plotFingerprint -b {input.s11} {input.s12} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s11s12} -p {threads}")

### Pmac cens selection
## criteria: peaks w msi12 and flamked by silent heterochromatin (the valley inside)
## manually extracted from IGV 
# file: ../../data/processed/deeptools/211116/Pmac_cens_candidates.bed
rule igv_pmac_211116:
    input:
        igv="../../data/processed/deeptools/211116/Pmac_cens_candidates.bed"

