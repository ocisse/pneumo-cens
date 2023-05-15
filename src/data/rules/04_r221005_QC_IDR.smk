####
include: "02_r221005_mapping.smk"

rule qc:
   input:
        s1=rules.mark_dup221005.output.s1,
        s2=rules.mark_dup221005.output.s2,
        s3=rules.mark_dup221005.output.s3,
        s4=rules.mark_dup221005.output.s4,

   output:
        s1="../../data/processed/qc/221005/S1",
        s2="../../data/processed/qc/221005/S2",
        s3="../../data/processed/qc/221005/S3",
        s4="../../data/processed/qc/221005/S4",

   run:
        shell("../tools/run_spp.R -c={input.s1} -out={output.s1}")
        shell("../tools/run_spp.R -c={input.s2} -out={output.s2}")
        shell("../tools/run_spp.R -c={input.s3} -out={output.s3}")
        shell("../tools/run_spp.R -c={input.s4} -out={output.s4}")

