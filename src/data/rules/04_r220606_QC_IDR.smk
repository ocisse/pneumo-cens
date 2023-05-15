####
include: "02_r220606_mapping.smk"

rule qc:
   input:
        s1=rules.mark_dup220606.output.s1,
        s5=rules.mark_dup220606.output.s5,
        s6=rules.mark_dup220606.output.s6,
        s8=rules.mark_dup220606.output.s8,

   output:
        s1="../../data/processed/qc/220606/S1",
        s5="../../data/processed/qc/220606/S5",
        s6="../../data/processed/qc/220606/S6",
        s8="../../data/processed/qc/220606/S8",

   run:
        shell("../tools/run_spp.R -c={input.s1} -out={output.s1}")
        shell("../tools/run_spp.R -c={input.s5} -out={output.s5}")
        shell("../tools/run_spp.R -c={input.s6} -out={output.s6}")
        shell("../tools/run_spp.R -c={input.s8} -out={output.s8}")

