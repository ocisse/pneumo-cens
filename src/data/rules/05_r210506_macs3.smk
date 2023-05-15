####
include: "02_r210506_mapping.smk"

rule callpeak_narrow:
    input:
        pcn=rules.mark_dup210506.output.pcn,
        pch=rules.mark_dup210506.output.pch,
        pcc=rules.mark_dup210506.output.pcc,
        pca=rules.mark_dup210506.output.pca,
        
    
    output:
        pca=directory("../../data/processed/macs2/210506/PcA"),
        pcc=directory("../../data/processed/macs2/210506/PcC"),
        pch=directory("../../data/processed/macs2/210506/PcH"),    
    threads: 12
    params:
        p="-f BAMPE -g 7.4e6 --SPMR --qvalue 0.05 --keep-dup all"
    run:
        shell("macs3 callpeak -t {input.pca} -c {input.pcn} --outdir {output.pca} {params.p} -n PcA")
        shell("macs3 callpeak -t {input.pcc} -c {input.pcn} --outdir {output.pcc} {params.p} -n PcC")
        shell("macs3 callpeak -t {input.pch} -c {input.pcn} --outdir {output.pch} {params.p} -n PcH")
