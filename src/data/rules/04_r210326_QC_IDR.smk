####
include: "02_r210326_mapping.smk"

rule qc:
   input:
        pmd0a=rules.picard.output.pmd0a,
        pmd0h=rules.picard.output.pmd0h,
        pmd7a=rules.picard.output.pmd7a,
        pmd7h=rules.picard.output.pmd7h,
        pmd14a=rules.picard.output.pmd14a,
        pmd14h=rules.picard.output.pmd14h,
        za=rules.picard.output.za,
        zh=rules.picard.output.zh,
        p3ca=rules.picard.output.p3ca,
        p3ch=rules.picard.output.p3ch,
        p2ca=rules.picard.output.p2ca,
        p2ch=rules.picard.output.p2ch,
    
   output:
        pmd0a="../../data/processed/qc/210326/Pm_Inc_A",
#        pmd0h="../../data/processed/qc/210326/Pm_Inc_H3",
#        pmd7a="../../data/processed/qc/210326/Pm_D7_A",
#        pmd7h="../../data/processed/qc/210326/Pm_D7_H3",
#        pmd14a="../../data/processed/qc/210326/Pm_D14_A",
#        pmd14h="../../data/processed/qc/210326/Pm_D14_H3",
#        p3ca="../../data/processed/qc/210326/PmacP3C_A",
#        p3ch="../../data/processed/qc/210326/PmacP3C_H3",
#        za="../../data/processed/qc/210326/PjZA_A",
#        zh="../../data/processed/qc/210326/PjZA_H",
#        p2ca="../../data/processed/qc/210326/PmacP2C_A",
#        p2ch="../../data/processed/qc/210326/PmacP2C_H3"

   run:
        shell("../tools/run_spp.R -c={input.pmd0a} -out={output.pmd0a}")
#        shell("../tools/run_spp.R -c={input.pmd0h} -out={output.pmd0h}")
#        shell("../tools/run_spp.R -c={input.pmd7a} -out={output.pmd7a}")
#        shell("../tools/run_spp.R -c={input.pmd7h} -out={output.pmd7h}")
#        shell("../tools/run_spp.R -c={input.pmd14a} -out={output.pmd14a}")
#        shell("../tools/run_spp.R -c={input.pmd14h} -out={output.pmd14h}")
#        shell("../tools/run_spp.R -c={input.p3ca} -out={output.p3ca}")
#        shell("../tools/run_spp.R -c={input.p3ch} -out={output.p3ch}")
#        shell("../tools/run_spp.R -c={input.za} -out={output.za}")
#        shell("../tools/run_spp.R -c={input.zh} -out={output.zh}")
#        shell("../tools/run_spp.R -c={input.p2ca} -out={output.p2ca}")
#        shell("../tools/run_spp.R -c={input.p2ch} -out={output.p2ch}")
 
