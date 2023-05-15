####
## need to index the bam first -- look at gatk rules but for nwo
# samtools index -b ../../data/processed/mapping/201103/Pc-A.dr.bam
# cd ~/projects/Centromeres/data/processed/mapping/201103
# ls *.dr.bam  | while read f; do samtools index -b $f;done
include: "02_r211220_mapping.smk"
include: "02_r220606_mapping.smk"

# module load samtools ; conda version is buggy
# 
rule index220606:
   input:
        s20=rules.mark_dup211220.output.s20, # input from Pm culture d10 from r2111220
        s1=rules.mark_dup220606.output.s1, # pm cenpa
        s5=rules.mark_dup220606.output.s5, # pc cenpa 
        s6=rules.mark_dup220606.output.s6, # pc cenpc
        s8=rules.mark_dup220606.output.s8, # pc intput
   run:
        shell("samtools index {input.s1}") 
        shell("samtools index {input.s5}")
        shell("samtools index {input.s6}")
        shell("samtools index {input.s8}")
        
rule bamCompare220606:
   input:
        s1=rules.mark_dup220606.output.s1,
        s20=rules.mark_dup211220.output.s20,
        s5=rules.mark_dup220606.output.s5,
        s6=rules.mark_dup220606.output.s6,
        s8=rules.mark_dup220606.output.s8,

   output:
        s1s20="../../data/processed/deeptools/220606/S1_S20_log2ratio.bw",
        s5s8="../../data/processed/deeptools/220606/S5_S8_log2ratio.bw",
        s6s8="../../data/processed/deeptools/220606/S6_S8_log2ratio.bw",

   params: of="bigwig", bs="10",  flg="64", n="None", pmgs="7451359", pcgs="7661456", pmacgs="8274841"
   threads: 6 
   run:
        shell("bamCompare -p {threads} -b1 {input.s1} -b2 {input.s20} -o {output.s1s20}  -bs {params.bs} --effectiveGenomeSize {params.pmgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s5} -b2 {input.s8} -o {output.s5s8}  -bs {params.bs} --effectiveGenomeSize {params.pcgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")
        shell("bamCompare -p {threads} -b1 {input.s6} -b2 {input.s8} -o {output.s6s8}  -bs {params.bs} --effectiveGenomeSize {params.pcgs} --samFlagInclude {params.flg} --normalizeUsing {params.n} --extendReads")

rule plotFingerprint220606:
   input:
        s20=rules.mark_dup211220.output.s20,
        s1=rules.mark_dup220606.output.s1,
        s5=rules.index220606.input.s5,
        s6=rules.index220606.input.s6,
        s8=rules.index220606.input.s8,
   output:
        s1s20="../../data/processed/deeptools/220606/S1_S20_fingerprints.png",
        s5s8="../../data/processed/deeptools/220606/S5_S8_fingerprints.png",
        s6s8="../../data/processed/deeptools/220606/S6_S8_fingerprints.png",
   params: q="30", t="\"Fingerprints of different samples\""
   threads: 12
   run:
        shell("plotFingerprint -b {input.s1} {input.s20} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s1s20} -p {threads}")
        shell("plotFingerprint -b {input.s5} {input.s8} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s5s8} -p {threads}")
        shell("plotFingerprint -b {input.s6} {input.s8} --minMappingQuality {params.q} --skipZeros -T {params.t} -plot {output.s6s8} -p {threads}")

