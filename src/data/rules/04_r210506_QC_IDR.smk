####
include: "02_r210506_mapping.smk"

rule qc:
   input:
        pcn=rules.picard.output.pcn,
        pch=rules.picard.output.pch,
        pcc=rules.picard.output.pcc,
        pca=rules.picard.output.pca,
        p3cn=rules.picard.output.p3cn,
        p3cc=rules.picard.output.p3cc,
        p2crg=rules.picard.output.p2crg,
        p2cn=rules.picard.output.p2cn,
        spn=rules.picard.output.spn,
        sph=rules.picard.output.sph,
        spc=rules.picard.output.spc,
        spa=rules.picard.output.spa,
    
   output:
        pcn="../../data/processed/qc/210506/PcN",
        pch="../../data/processed/qc/210506/PcH",
        pcc="../../data/processed/qc/210506/PcC",
        pca="../../data/processed/qc/210506/PcA",
        p3cn="../../data/processed/qc/210506/P3CN",
        p3cc="../../data/processed/qc/210506/P3CC",
        p2crg="../../data/processed/qc/210506/P2CR",
        p2cn="../../data/processed/qc/210506/P2CN",
        spn="../../data/processed/qc/210506/SpN",
        sph="../../data/processed/qc/210506/SpH",
        spc="../../data/processed/qc/210506/SpC",
        spa="../../data/processed/qc/210506/SpA",
   run:
        shell("../tools/run_spp.R -c={input.pcn} -out={output.pcn}")
        shell("../tools/run_spp.R -c={input.pch} -out={output.pch}")
        shell("../tools/run_spp.R -c={input.pcc} -out={output.pcc}")
        shell("../tools/run_spp.R -c={input.pca} -out={output.pca}")
        shell("../tools/run_spp.R -c={input.p3cn} -out={output.p3cn}")
        shell("../tools/run_spp.R -c={input.p3cc} -out={output.p3cc}")
        shell("../tools/run_spp.R -c={input.p2crg} -out={output.p2crg}")
        shell("../tools/run_spp.R -c={input.p2cn} -out={output.p2cn}")
        shell("../tools/run_spp.R -c={input.spn} -out={output.spn}")
        shell("../tools/run_spp.R -c={input.sph} -out={output.sph}")
        shell("../tools/run_spp.R -c={input.spc} -out={output.spc}")
        shell("../tools/run_spp.R -c={input.spa} -out={output.spa}")
 
