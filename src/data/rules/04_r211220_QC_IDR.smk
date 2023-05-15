####
include: "02_r211220_mapping.smk"

rule qc:
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
        s1="../../data/processed/qc/211220/S1",
        s2="../../data/processed/qc/211220/S2",
        s3="../../data/processed/qc/211220/S3",
        s4="../../data/processed/qc/211220/S4",
        s5="../../data/processed/qc/211220/S5",
        s6="../../data/processed/qc/211220/S6",
        s7="../../data/processed/qc/211220/S7",
        s8="../../data/processed/qc/211220/S8",
        s9="../../data/processed/qc/211220/S9",
        s10="../../data/processed/qc/211220/S10",
        s11="../../data/processed/qc/211220/S11",
        s12="../../data/processed/qc/211220/S12",
        s13="../../data/processed/qc/211220/S13",
        s14="../../data/processed/qc/211220/S14",
        s15="../../data/processed/qc/211220/S15",
        s16="../../data/processed/qc/211220/S16",
        s17="../../data/processed/qc/211220/S17",
        s18="../../data/processed/qc/211220/S18",
        s19="../../data/processed/qc/211220/S19",
        s20="../../data/processed/qc/211220/S20",
        s21="../../data/processed/qc/211220/S21",
        s22="../../data/processed/qc/211220/S22",
        s23="../../data/processed/qc/211220/S23",
        s24="../../data/processed/qc/211220/S24",

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
        shell("../tools/run_spp.R -c={input.s13} -out={output.s13}")
        shell("../tools/run_spp.R -c={input.s14} -out={output.s14}")
        shell("../tools/run_spp.R -c={input.s15} -out={output.s15}")
        shell("../tools/run_spp.R -c={input.s16} -out={output.s16}")
        shell("../tools/run_spp.R -c={input.s17} -out={output.s17}")
        shell("../tools/run_spp.R -c={input.s18} -out={output.s18}")
        shell("../tools/run_spp.R -c={input.s19} -out={output.s19}")
        shell("../tools/run_spp.R -c={input.s20} -out={output.s20}")
        shell("../tools/run_spp.R -c={input.s21} -out={output.s21}")
        shell("../tools/run_spp.R -c={input.s22} -out={output.s22}")
        shell("../tools/run_spp.R -c={input.s23} -out={output.s23}")
        shell("../tools/run_spp.R -c={input.s24} -out={output.s24}")

