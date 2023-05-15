####
include: "02_r221005_mapping.smk"

# module load samtools ; conda version is buggy
# 
rule index221005:
   input:
        s1=rules.mark_dup221005.output.s1, # pc d7 cenpa
        s2=rules.mark_dup221005.output.s2, # pc d7 input
        s3=rules.mark_dup221005.output.s3, # pc d0 cenpa
        s4=rules.mark_dup221005.output.s4, # pc d0 input
   run:
        shell("samtools index {input.s1}") 
        shell("samtools index {input.s2}")
        shell("samtools index {input.s3}")
        shell("samtools index {input.s4}")
        
rule bamCompare221005:
   input:
        s1=rules.mark_dup221005.output.s1,
        s2=rules.mark_dup221005.output.s2,
        s3=rules.mark_dup221005.output.s3,
        s4=rules.mark_dup221005.output.s4,

   output:
        s1s2="../../data/processed/deeptools/221005/S1_S2_log2ratio.bw",
        s3s4="../../data/processed/deeptools/221005/S3_S4_log2ratio.bw",

   params: of="bigwig", bs="10",  flg="64", n="None", pmgs="7451359", pcgs="7661456", pmacgs="8274841"
   threads: 6 
   run:
        shell("bamCompare -p {threads} -b1 {input.s1} -b2 {input.s2} -o {output.s1s2}  -bs {params.bs} --effectiveGenomeSize {params.pcgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s3} -b2 {input.s4} -o {output.s3s4}  -bs {params.bs} --effectiveGenomeSize {params.pcgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")

rule plotFingerprint221005:
   input:
        s1=rules.index221005.input.s1,
        s2=rules.index221005.input.s2,
        s3=rules.index221005.input.s3,
        s4=rules.index221005.input.s4,
   output:
        s1s2="../../data/processed/deeptools/221005/S1_S2_fingerprints.png",
        s3s4="../../data/processed/deeptools/221005/S3_S4_fingerprints.png",
   params: q="30", t="\"Fingerprints of different samples\""
   threads: 12
   run:
        shell("plotFingerprint -b {input.s1} {input.s2} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s1s2} -p {threads}")
        shell("plotFingerprint -b {input.s3} {input.s4} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s3s4} -p {threads}")

