####
include: "02_r210927_mapping.smk"

rule qc:
   input:
        s1=rules.mark_dup210927.output.s1,
        s2=rules.mark_dup210927.output.s2,
        s3=rules.mark_dup210927.output.s3,
        s4=rules.mark_dup210927.output.s4,
        s5=rules.mark_dup210927.output.s5,
        s6=rules.mark_dup210927.output.s6,
        s7=rules.mark_dup210927.output.s7,
        s8=rules.mark_dup210927.output.s8,
        s9=rules.mark_dup210927.output.s9,
        s10=rules.mark_dup210927.output.s10,
        s11=rules.mark_dup210927.output.s11,
        s12=rules.mark_dup210927.output.s12,

   output:
        s1="../../data/processed/qc/210927/S1",
        s2="../../data/processed/qc/210927/S2",
        s3="../../data/processed/qc/210927/S3",
        s4="../../data/processed/qc/210927/S4",
        s5="../../data/processed/qc/210927/S5",
        s6="../../data/processed/qc/210927/S6",
        s7="../../data/processed/qc/210927/S7",
        s8="../../data/processed/qc/210927/S8",
        s9="../../data/processed/qc/210927/S9",
        s10="../../data/processed/qc/210927/S10",
        s11="../../data/processed/qc/210927/S11",
        s12="../../data/processed/qc/210927/S12",
        
   run:
        shell("../tools/run_spp.R -c={input.s1} -out={output.s1}")
        shell("../tools/run_spp.R -c={input.s2} -out={output.s2}")
        shell("../tools/run_spp.R -c={input.s3} -out={output.s3}")
        shell("../tools/run_spp.R -c={input.s4} -out={output.s4}")
        shell("../tools/run_spp.R -c={input.s5} -out={output.s5}")
        shell("../tools/run_spp.R -c={input.s6} -out={output.s6}")
        shell("../tools/run_spp.R -c={input.s7} -out={output.s7}")
        shell("../tools/run_spp.R -c={input.s8} -out={output.s8}")
        shell("../tools/run_spp.R -c={input.s9} -out={output.s9}")
        shell("../tools/run_spp.R -c={input.s10} -out={output.s10}")
        shell("../tools/run_spp.R -c={input.s11} -out={output.s11}")
        shell("../tools/run_spp.R -c={input.s12} -out={output.s12}")

