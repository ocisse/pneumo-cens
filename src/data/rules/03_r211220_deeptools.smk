####
## need to index the bam first -- look at gatk rules but for nwo
# samtools index -b ../../data/processed/mapping/201103/Pc-A.dr.bam
# cd ~/projects/Centromeres/data/processed/mapping/201103
# ls *.dr.bam  | while read f; do samtools index -b $f;done

include: "02_r211220_mapping.smk"

# module load samtools ; conda version is buggy
# 
rule index211220:
   input:
        s1=rules.mark_dup211220.output.s1,
        s2=rules.mark_dup211220.output.s2,
        s3=rules.mark_dup211220.output.s3,
        s4=rules.mark_dup211220.output.s4,
        s5=rules.mark_dup211220.output.s5,
        s6=rules.mark_dup211220.output.s6,
        s7=rules.mark_dup211220.output.s7,
        s8=rules.mark_dup211220.output.s8,
        s9=rules.mark_dup211220.output.s9,
        s10=rules.mark_dup211220.output.s10,
        s11=rules.mark_dup211220.output.s11,
        s12=rules.mark_dup211220.output.s12,
        s13=rules.mark_dup211220.output.s13,
        s14=rules.mark_dup211220.output.s14,
        s15=rules.mark_dup211220.output.s15,
        s16=rules.mark_dup211220.output.s16,
        s17=rules.mark_dup211220.output.s17,
        s18=rules.mark_dup211220.output.s18,
        s19=rules.mark_dup211220.output.s19,
        s20=rules.mark_dup211220.output.s20,
        s21=rules.mark_dup211220.output.s21,
        s22=rules.mark_dup211220.output.s22,
        s23=rules.mark_dup211220.output.s23,
        s24=rules.mark_dup211220.output.s24,

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
        shell("samtools index {input.s13}")
        shell("samtools index {input.s14}")
        shell("samtools index {input.s15}")
        shell("samtools index {input.s16}")
        shell("samtools index {input.s17}")
        shell("samtools index {input.s18}")
        shell("samtools index {input.s19}")
        shell("samtools index {input.s20}")
        shell("samtools index {input.s21}")
        shell("samtools index {input.s22}")
        shell("samtools index {input.s23}")
        shell("samtools index {input.s24}")

rule bamCompare211220:
   input:
        s1=rules.mark_dup211220.output.s1,
        s2=rules.mark_dup211220.output.s2,
        s3=rules.mark_dup211220.output.s3,
        s4=rules.mark_dup211220.output.s4,
        s5=rules.mark_dup211220.output.s5,
        s6=rules.mark_dup211220.output.s6,
        s7=rules.mark_dup211220.output.s7,
        s8=rules.mark_dup211220.output.s8,
        s9=rules.mark_dup211220.output.s9,
        s10=rules.mark_dup211220.output.s10,
        s11=rules.mark_dup211220.output.s11,
        s12=rules.mark_dup211220.output.s12,
        s13=rules.mark_dup211220.output.s13,
        s14=rules.mark_dup211220.output.s14,
        s15=rules.mark_dup211220.output.s15,
        s16=rules.mark_dup211220.output.s16,
        s17=rules.mark_dup211220.output.s17,
        s18=rules.mark_dup211220.output.s18,
        s19=rules.mark_dup211220.output.s19,
        s20=rules.mark_dup211220.output.s20,
        s21=rules.mark_dup211220.output.s21,
        s22=rules.mark_dup211220.output.s22,
        s23=rules.mark_dup211220.output.s23,
        s24=rules.mark_dup211220.output.s24,

   output:
        s1s2="../../data/processed/deeptools/211220/S1_S2_log2ratio.bw",
        s3s4="../../data/processed/deeptools/211220/S3_S4_log2ratio.bw",
        s6s5="../../data/processed/deeptools/211220/S6_S5_log2ratio.bw",
        s7s5="../../data/processed/deeptools/211220/S7_S5_log2ratio.bw",
        s8s5="../../data/processed/deeptools/211220/S8_S5_log2ratio.bw",
        s9s5="../../data/processed/deeptools/211220/S9_S5_log2ratio.bw",
        s10s5="../../data/processed/deeptools/211220/S10_S5_log2ratio.bw",
        s11s5="../../data/processed/deeptools/211220/S11_S5_log2ratio.bw",
        s12s5="../../data/processed/deeptools/211220/S12_S5_log2ratio.bw",
        s13s18="../../data/processed/deeptools/211220/S13_S18_log2ratio.bw",
        s14s18="../../data/processed/deeptools/211220/S14_S18_log2ratio.bw",
        s15s18="../../data/processed/deeptools/211220/S15_S18_log2ratio.bw",
        s16s18="../../data/processed/deeptools/211220/S16_S18_log2ratio.bw",
        s17s18="../../data/processed/deeptools/211220/S17_S18_log2ratio.bw",
        s19s20="../../data/processed/deeptools/211220/S19_S20_log2ratio.bw",
        s21s20="../../data/processed/deeptools/211220/S21_S20_log2ratio.bw",
        s22s20="../../data/processed/deeptools/211220/S22_S20_log2ratio.bw",
        s23s20="../../data/processed/deeptools/211220/S23_S20_log2ratio.bw",
        s24s20="../../data/processed/deeptools/211220/S24_S20_log2ratio.bw",
        
        

   params: of="bigwig", bs="10",  flg="64", n="None", pmgs="7451359", pcgs="7661456", pmacgs="8274841",  pjgs="8396240"
   threads: 6 
   run:
        shell("bamCompare -p {threads} -b1 {input.s1} -b2 {input.s2} -o {output.s1s2}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s3} -b2 {input.s4} -o {output.s3s4}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s6} -b2 {input.s5} -o {output.s6s5}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads") 
        shell("bamCompare -p {threads} -b1 {input.s7} -b2 {input.s5} -o {output.s7s5}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s8} -b2 {input.s5} -o {output.s8s5}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s9} -b2 {input.s5} -o {output.s9s5}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s10} -b2 {input.s5} -o {output.s10s5}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s11} -b2 {input.s5} -o {output.s11s5}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s12} -b2 {input.s5} -o {output.s12s5}  -bs {params.bs} --effectiveGenomeSize {params.pmacgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s13} -b2 {input.s18} -o {output.s13s18}  -bs {params.bs} --effectiveGenomeSize {params.pjgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s14} -b2 {input.s18} -o {output.s14s18}  -bs {params.bs} --effectiveGenomeSize {params.pjgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s15} -b2 {input.s18} -o {output.s15s18}  -bs {params.bs} --effectiveGenomeSize {params.pjgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s16} -b2 {input.s18} -o {output.s16s18}  -bs {params.bs} --effectiveGenomeSize {params.pjgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s17} -b2 {input.s18} -o {output.s17s18}  -bs {params.bs} --effectiveGenomeSize {params.pjgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s19} -b2 {input.s20} -o {output.s19s20}  -bs {params.bs} --effectiveGenomeSize {params.pmgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s21} -b2 {input.s20} -o {output.s21s20}  -bs {params.bs} --effectiveGenomeSize {params.pmgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s22} -b2 {input.s20} -o {output.s22s20}  -bs {params.bs} --effectiveGenomeSize {params.pmgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s23} -b2 {input.s20} -o {output.s23s20}  -bs {params.bs} --effectiveGenomeSize {params.pmgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s24} -b2 {input.s20} -o {output.s24s20}  -bs {params.bs} --effectiveGenomeSize {params.pmgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")

rule plotFingerprint211220:
   input:
        s1=rules.index211220.input.s1,
        s2=rules.index211220.input.s2,
        s3=rules.index211220.input.s3,
        s4=rules.index211220.input.s4,
        s5=rules.index211220.input.s5,
        s6=rules.index211220.input.s6,
        s7=rules.index211220.input.s7,
        s8=rules.index211220.input.s8,
        s9=rules.index211220.input.s9,
        s10=rules.index211220.input.s10,
        s11=rules.index211220.input.s11,
        s12=rules.index211220.input.s12,
        s13=rules.index211220.input.s13,
        s14=rules.index211220.input.s14,
        s15=rules.index211220.input.s15,
        s16=rules.index211220.input.s16,
        s17=rules.index211220.input.s17,
        s18=rules.index211220.input.s18,
        s19=rules.index211220.input.s19,
        s20=rules.index211220.input.s20,
        s21=rules.index211220.input.s21,
        s22=rules.index211220.input.s22,
        s23=rules.index211220.input.s23,
        s24=rules.index211220.input.s24,

   output:
        s1s2="../../data/processed/deeptools/211220/S1_S2_fingerprints.png",
        s3s4="../../data/processed/deeptools/211220/S3_S4_fingerprints.png",
        s6s5="../../data/processed/deeptools/211220/S6_S5__fingerprints.png",
        s7s5="../../data/processed/deeptools/211220/S7_S5__fingerprints.png",
        s8s5="../../data/processed/deeptools/211220/S8_S5__fingerprints.png",
        s9s5="../../data/processed/deeptools/211220/S9_S5__fingerprints.png",
        s10s5="../../data/processed/deeptools/211220/S10_S5__fingerprints.png",
        s11s5="../../data/processed/deeptools/211220/S11_S5__fingerprints.png",
        s12s5="../../data/processed/deeptools/211220/S12_S5__fingerprints.png",
        s13s18="../../data/processed/deeptools/211220/S13_S18__fingerprints.png",
        s14s18="../../data/processed/deeptools/211220/S14_S18__fingerprints.png",
        s15s18="../../data/processed/deeptools/211220/S15_S18__fingerprints.png",
        s16s18="../../data/processed/deeptools/211220/S16_S18__fingerprints.png",
        s17s18="../../data/processed/deeptools/211220/S17_S18__fingerprints.png",
        s19s20="../../data/processed/deeptools/211220/S19_S20__fingerprints.png",
        s21s20="../../data/processed/deeptools/211220/S21_S20__fingerprints.png",
        s22s20="../../data/processed/deeptools/211220/S22_S20__fingerprints.png",
        s23s20="../../data/processed/deeptools/211220/S23_S20__fingerprints.png",
        s24s20="../../data/processed/deeptools/211220/S24_S20__fingerprints.png",

   params: q="30", t="\"Fingerprints of different samples\""
    
    threads: 12
    
    run:
        shell("plotFingerprint -b {input.s1} {input.s2} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s1s2} -p {threads}")
        shell("plotFingerprint -b {input.s3} {input.s4} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s3s4} -p {threads}")
        shell("plotFingerprint -b {input.s6} {input.s5} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s6s5} -p {threads}")
        shell("plotFingerprint -b {input.s7} {input.s5} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s7s5} -p {threads}")
        shell("plotFingerprint -b {input.s8} {input.s5} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s8s5} -p {threads}")
        shell("plotFingerprint -b {input.s9} {input.s5} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s9s5} -p {threads}")
        shell("plotFingerprint -b {input.s10} {input.s5} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s10s5} -p {threads}")
        shell("plotFingerprint -b {input.s11} {input.s5} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s11s5} -p {threads}")
        shell("plotFingerprint -b {input.s12} {input.s5} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s12s5} -p {threads}")
        shell("plotFingerprint -b {input.s13} {input.s18} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s13s18} -p {threads}")
        shell("plotFingerprint -b {input.s14} {input.s18} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s14s18} -p {threads}")
        shell("plotFingerprint -b {input.s15} {input.s18} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s15s18} -p {threads}")
        shell("plotFingerprint -b {input.s16} {input.s18} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s16s18} -p {threads}")
        shell("plotFingerprint -b {input.s17} {input.s18} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s17s18} -p {threads}")
        shell("plotFingerprint -b {input.s19} {input.s20} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s19s20} -p {threads}")
        shell("plotFingerprint -b {input.s21} {input.s20} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s21s20} -p {threads}")
        shell("plotFingerprint -b {input.s22} {input.s20} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s22s20} -p {threads}")
        shell("plotFingerprint -b {input.s23} {input.s20} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s23s20} -p {threads}")
        shell("plotFingerprint -b {input.s24} {input.s20} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s24s20} -p {threads}")
         
rule coverage:
    input:
        s1=rules.mark_dup211220.output.s1,
        s2=rules.mark_dup211220.output.s2,
        s3=rules.mark_dup211220.output.s3,
        s4=rules.mark_dup211220.output.s4,
        s5=rules.mark_dup211220.output.s5,
        s6=rules.mark_dup211220.output.s6,
        s7=rules.mark_dup211220.output.s7,
        s8=rules.mark_dup211220.output.s8,
        s9=rules.mark_dup211220.output.s9,
        s10=rules.mark_dup211220.output.s10,
        s11=rules.mark_dup211220.output.s11,
        s12=rules.mark_dup211220.output.s12,
        s13=rules.mark_dup211220.output.s13,
        s14=rules.mark_dup211220.output.s14,
        s15=rules.mark_dup211220.output.s15,
        s16=rules.mark_dup211220.output.s16,
        s17=rules.mark_dup211220.output.s17,
        s18=rules.mark_dup211220.output.s18,
        s19=rules.mark_dup211220.output.s19,
        s20=rules.mark_dup211220.output.s20,
        s21=rules.mark_dup211220.output.s21,
        s22=rules.mark_dup211220.output.s22,
        s23=rules.mark_dup211220.output.s23,
        s24=rules.mark_dup211220.output.s24,
    output:
        s1="../../data/processed/deeptools/211220/s1.coverage.bg",
        s2="../../data/processed/deeptools/211220/s2.coverage.bg",
        s3="../../data/processed/deeptools/211220/s3.coverage.bg",
        s4="../../data/processed/deeptools/211220/s4.coverage.bg",
        s5="../../data/processed/deeptools/211220/s5.coverage.bg",
        s6="../../data/processed/deeptools/211220/s6.coverage.bg",
        s7="../../data/processed/deeptools/211220/s7.coverage.bg",
        s8="../../data/processed/deeptools/211220/s8.coverage.bg",
        s9="../../data/processed/deeptools/211220/s9.coverage.bg",
        s10="../../data/processed/deeptools/211220/s10.coverage.bg",
        s11="../../data/processed/deeptools/211220/s11.coverage.bg",
        s12="../../data/processed/deeptools/211220/s12.coverage.bg",
        s13="../../data/processed/deeptools/211220/s13.coverage.bg",
        s14="../../data/processed/deeptools/211220/s14.coverage.bg",
        s15="../../data/processed/deeptools/211220/s15.coverage.bg",
        s16="../../data/processed/deeptools/211220/s16.coverage.bg",
        s17="../../data/processed/deeptools/211220/s17.coverage.bg",
        s18="../../data/processed/deeptools/211220/s18.coverage.bg",
        s19="../../data/processed/deeptools/211220/s19.coverage.bg",
        s20="../../data/processed/deeptools/211220/s20.coverage.bg",
        s21="../../data/processed/deeptools/211220/s21.coverage.bg",
        s22="../../data/processed/deeptools/211220/s22.coverage.bg",
        s23="../../data/processed/deeptools/211220/s23.coverage.bg",
        s24="../../data/processed/deeptools/211220/s24.coverage.bg",
    threads: 6
    resources: tmpdir="/hpcdata/dcr_cc/Ousmane_Data/projects/tmp"
    params:
        b="50", norm="RPGC", pmgs="7451359", f="bedgraph", pcgs="7661456", pjgs="8396240", pmacgs="8274841"
    run:
        shell("bamCoverage -p {threads} --bam {input.s1} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s1}")
        shell("bamCoverage -p {threads} --bam {input.s2} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s2}")
        shell("bamCoverage -p {threads} --bam {input.s3} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s3}")
        shell("bamCoverage -p {threads} --bam {input.s4} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s4}")
        shell("bamCoverage -p {threads} --bam {input.s5} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s5}")
        shell("bamCoverage -p {threads} --bam {input.s6} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s6}")
        shell("bamCoverage -p {threads} --bam {input.s7} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s7}")
        shell("bamCoverage -p {threads} --bam {input.s8} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s8}")
        shell("bamCoverage -p {threads} --bam {input.s9} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s9}")
        shell("bamCoverage -p {threads} --bam {input.s10} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s10}")
        shell("bamCoverage -p {threads} --bam {input.s11} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s11}")
        shell("bamCoverage -p {threads} --bam {input.s12} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmacgs} --extendReads --outFileFormat {params.f} --outFileName {output.s12}")
        shell("bamCoverage -p {threads} --bam {input.s13} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pjgs} --extendReads --outFileFormat {params.f} --outFileName {output.s13}")
        shell("bamCoverage -p {threads} --bam {input.s14} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pjgs} --extendReads --outFileFormat {params.f} --outFileName {output.s14}")
        shell("bamCoverage -p {threads} --bam {input.s15} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pjgs} --extendReads --outFileFormat {params.f} --outFileName {output.s15}")
        shell("bamCoverage -p {threads} --bam {input.s16} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pjgs} --extendReads --outFileFormat {params.f} --outFileName {output.s16}")
        shell("bamCoverage -p {threads} --bam {input.s17} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pjgs} --extendReads --outFileFormat {params.f} --outFileName {output.s17}")
        shell("bamCoverage -p {threads} --bam {input.s18} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pjgs} --extendReads --outFileFormat {params.f} --outFileName {output.s18}")
        shell("bamCoverage -p {threads} --bam {input.s19} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --extendReads --outFileFormat {params.f} --outFileName {output.s19}")
        shell("bamCoverage -p {threads} --bam {input.s20} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --extendReads --outFileFormat {params.f} --outFileName {output.s20}")
        shell("bamCoverage -p {threads} --bam {input.s21} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --extendReads --outFileFormat {params.f} --outFileName {output.s21}")
        shell("bamCoverage -p {threads} --bam {input.s22} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --extendReads --outFileFormat {params.f} --outFileName {output.s22}")
        shell("bamCoverage -p {threads} --bam {input.s23} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --extendReads --outFileFormat {params.f} --outFileName {output.s23}")
        shell("bamCoverage -p {threads} --bam {input.s24} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} --extendReads --outFileFormat {params.f} --outFileName {output.s24}")

# compute which fracton of the genome is cover
rule fraction_cov:
    input:
        s1=rules.coverage.output.s1,
        s2=rules.coverage.output.s2,
        s3=rules.coverage.output.s3,
        s4=rules.coverage.output.s4,
        s5=rules.coverage.output.s5,
        s6=rules.coverage.output.s6,
        s7=rules.coverage.output.s7,
        s8=rules.coverage.output.s8,
        s9=rules.coverage.output.s9,
        s10=rules.coverage.output.s10,
        s11=rules.coverage.output.s11,
        s12=rules.coverage.output.s12,
        s13=rules.coverage.output.s13,
        s14=rules.coverage.output.s14,
        s15=rules.coverage.output.s15,
        s16=rules.coverage.output.s16,
        s17=rules.coverage.output.s17,
        s18=rules.coverage.output.s18,
        s19=rules.coverage.output.s19,
        s20=rules.coverage.output.s20,
        s21=rules.coverage.output.s21,
        s22=rules.coverage.output.s22,
        s23=rules.coverage.output.s23,
        s24=rules.coverage.output.s24,
    output:
        s1="../../data/processed/deeptools/211220/s1.coverage.txt",
        s2="../../data/processed/deeptools/211220/s2.coverage.txt",
        s3="../../data/processed/deeptools/211220/s3.coverage.txt",
        s4="../../data/processed/deeptools/211220/s4.coverage.txt",
        s5="../../data/processed/deeptools/211220/s5.coverage.txt",
        s6="../../data/processed/deeptools/211220/s6.coverage.txt",
        s7="../../data/processed/deeptools/211220/s7.coverage.txt",
        s8="../../data/processed/deeptools/211220/s8.coverage.txt",
        s9="../../data/processed/deeptools/211220/s9.coverage.txt",
        s10="../../data/processed/deeptools/211220/s10.coverage.txt",
        s11="../../data/processed/deeptools/211220/s11.coverage.txt",
        s12="../../data/processed/deeptools/211220/s12.coverage.txt",
        s13="../../data/processed/deeptools/211220/s13.coverage.txt",
        s14="../../data/processed/deeptools/211220/s14.coverage.txt",
        s15="../../data/processed/deeptools/211220/s15.coverage.txt",
        s16="../../data/processed/deeptools/211220/s16.coverage.txt",
        s17="../../data/processed/deeptools/211220/s17.coverage.txt",
        s18="../../data/processed/deeptools/211220/s18.coverage.txt",
        s19="../../data/processed/deeptools/211220/s19.coverage.txt",
        s20="../../data/processed/deeptools/211220/s20.coverage.txt",
        s21="../../data/processed/deeptools/211220/s21.coverage.txt",
        s22="../../data/processed/deeptools/211220/s22.coverage.txt",
        s23="../../data/processed/deeptools/211220/s23.coverage.txt",
        s24="../../data/processed/deeptools/211220/s24.coverage.txt",
    params:
        ct="1"
    run:
        shell("perl ../scripts/compute_frac.pl --bg {input.s1}  --cutoff {params.ct} > {output.s1}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s2}  --cutoff {params.ct} > {output.s2}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s3}  --cutoff {params.ct} > {output.s3}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s4}  --cutoff {params.ct} > {output.s4}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s5}  --cutoff {params.ct} > {output.s5}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s6}  --cutoff {params.ct} > {output.s6}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s7}  --cutoff {params.ct} > {output.s7}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s8}  --cutoff {params.ct} > {output.s8}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s9}  --cutoff {params.ct} > {output.s9}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s10}  --cutoff {params.ct} > {output.s10}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s11}  --cutoff {params.ct} > {output.s11}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s12}  --cutoff {params.ct} > {output.s12}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s13}  --cutoff {params.ct} > {output.s13}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s14}  --cutoff {params.ct} > {output.s14}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s15}  --cutoff {params.ct} > {output.s15}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s16}  --cutoff {params.ct} > {output.s16}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s17}  --cutoff {params.ct} > {output.s17}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s18}  --cutoff {params.ct} > {output.s18}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s19}  --cutoff {params.ct} > {output.s19}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s20}  --cutoff {params.ct} > {output.s20}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s21}  --cutoff {params.ct} > {output.s21}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s22}  --cutoff {params.ct} > {output.s22}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s23}  --cutoff {params.ct} > {output.s23}")
        shell("perl ../scripts/compute_frac.pl --bg {input.s24}  --cutoff {params.ct} > {output.s24}")

rule extract_cen_coverage:
    input:
        pjcens="../../data/processed/pygenome/pj/pmacpcpm_combined_matches2pjg_mc.bed",
        pmaccens="../../data/processed/deeptools/211116/Pmac_cens_candidates.bed",
        pmcens="../../data/processed/macs2/191010/broad/Pmur_CC_CP/Pmur_CC_CP_peaks.broadPeak.mc_v2.bed",
        s1=rules.coverage.output.s1,
        s2=rules.coverage.output.s2,
        s3=rules.coverage.output.s3,
        s4=rules.coverage.output.s4,
        s5=rules.coverage.output.s5,
        s6=rules.coverage.output.s6,
        s7=rules.coverage.output.s7,
        s8=rules.coverage.output.s8,
        s9=rules.coverage.output.s9,
        s10=rules.coverage.output.s10,
        s11=rules.coverage.output.s11,
        s12=rules.coverage.output.s12,
        s13=rules.coverage.output.s13,
        s14=rules.coverage.output.s14,
        s15=rules.coverage.output.s15,
        s16=rules.coverage.output.s16,
        s17=rules.coverage.output.s17,
        s18=rules.coverage.output.s18,
        s19=rules.coverage.output.s19,
        s20=rules.coverage.output.s20,
        s21=rules.coverage.output.s21,
        s22=rules.coverage.output.s22,
        s23=rules.coverage.output.s23,
        s24=rules.coverage.output.s24,
    output:
        s1="../../data/processed/deeptools/211220/s1.coverage_cen.bg",
        s2="../../data/processed/deeptools/211220/s2.coverage_cen.bg",
        s3="../../data/processed/deeptools/211220/s3.coverage_cen.bg",
        s4="../../data/processed/deeptools/211220/s4.coverage_cen.bg",
        s5="../../data/processed/deeptools/211220/s5.coverage_cen.bg",
        s6="../../data/processed/deeptools/211220/s6.coverage_cen.bg",
        s7="../../data/processed/deeptools/211220/s7.coverage_cen.bg",
        s8="../../data/processed/deeptools/211220/s8.coverage_cen.bg",
        s9="../../data/processed/deeptools/211220/s9.coverage_cen.bg",
        s10="../../data/processed/deeptools/211220/s10.coverage_cen.bg",
        s11="../../data/processed/deeptools/211220/s11.coverage_cen.bg",
        s12="../../data/processed/deeptools/211220/s12.coverage_cen.bg",
        s13="../../data/processed/deeptools/211220/s13.coverage_cen.bg",
        s14="../../data/processed/deeptools/211220/s14.coverage_cen.bg",
        s15="../../data/processed/deeptools/211220/s15.coverage_cen.bg",
        s16="../../data/processed/deeptools/211220/s16.coverage_cen.bg",
        s17="../../data/processed/deeptools/211220/s17.coverage_cen.bg",
        s18="../../data/processed/deeptools/211220/s18.coverage_cen.bg",
        s19="../../data/processed/deeptools/211220/s19.coverage_cen.bg",
        s20="../../data/processed/deeptools/211220/s20.coverage_cen.bg",
        s21="../../data/processed/deeptools/211220/s21.coverage_cen.bg",
        s22="../../data/processed/deeptools/211220/s22.coverage_cen.bg",
        s23="../../data/processed/deeptools/211220/s23.coverage_cen.bg",
        s24="../../data/processed/deeptools/211220/s24.coverage_cen.bg",
    run:
        shell("bedtools intersect -a {input.s1} -b {input.pmaccens} > {output.s1}")
        shell("bedtools intersect -a {input.s2} -b {input.pmaccens} > {output.s2}")
        shell("bedtools intersect -a {input.s3} -b {input.pmaccens} > {output.s3}")
        shell("bedtools intersect -a {input.s4} -b {input.pmaccens} > {output.s4}")
        shell("bedtools intersect -a {input.s5} -b {input.pmaccens} > {output.s5}")
        shell("bedtools intersect -a {input.s6} -b {input.pmaccens} > {output.s6}")
        shell("bedtools intersect -a {input.s7} -b {input.pmaccens} > {output.s7}")
        shell("bedtools intersect -a {input.s8} -b {input.pmaccens} > {output.s8}")
        shell("bedtools intersect -a {input.s9} -b {input.pmaccens} > {output.s9}")
        shell("bedtools intersect -a {input.s10} -b {input.pmaccens} > {output.s10}")
        shell("bedtools intersect -a {input.s11} -b {input.pmaccens} > {output.s11}")
        shell("bedtools intersect -a {input.s12} -b {input.pmaccens} > {output.s12}")
        shell("bedtools intersect -a {input.s13} -b {input.pjcens} > {output.s13}")
        shell("bedtools intersect -a {input.s14} -b {input.pjcens} > {output.s14}")
        shell("bedtools intersect -a {input.s15} -b {input.pjcens} > {output.s15}")
        shell("bedtools intersect -a {input.s16} -b {input.pjcens} > {output.s16}")
        shell("bedtools intersect -a {input.s17} -b {input.pjcens} > {output.s17}")
        shell("bedtools intersect -a {input.s18} -b {input.pjcens} > {output.s18}")
        shell("bedtools intersect -a {input.s19} -b {input.pmcens} > {output.s19}")
        shell("bedtools intersect -a {input.s20} -b {input.pmcens} > {output.s20}")
        shell("bedtools intersect -a {input.s21} -b {input.pmcens} > {output.s21}")
        shell("bedtools intersect -a {input.s22} -b {input.pmcens} > {output.s22}")
        shell("bedtools intersect -a {input.s23} -b {input.pmcens} > {output.s23}")
        shell("bedtools intersect -a {input.s24} -b {input.pmcens} > {output.s24}")
        
# question
# what fraction of the genome is covered by H3K9me2 in P.muina
#  wc -l ../../data/processed/deeptools/211220/s21.coverage.bg # 73268 bins (of 50bp)
#  cat ../../data/processed/deeptools/211220/s21.coverage.bg | cut -f 4 | grep -E "0\$" | wc -l # 3407 empty bins
#  3407/73268 x 100 = 4.6% i.e. 95.4% of the genome is covered by H3K9me2
#
#  H3K9me3
#  wc -l ../../data/processed/deeptools/211220/s22.coverage.bg # 100056
#   cat ../../data/processed/deeptools/211220/s22.coverage.bg | cut -f 4 | grep -E "0\$" | wc -l # 178 empty bins
