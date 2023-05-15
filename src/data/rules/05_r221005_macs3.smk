####
include: "02_r221005_mapping.smk"

rule callpeak_narrow:
    input:
        s1=rules.mark_dup221005.output.s1, # pc d7 cenpa
        s2=rules.mark_dup221005.output.s2, # pc d7 input
        s3=rules.mark_dup221005.output.s3, # pc d0 cenpa
        s4=rules.mark_dup221005.output.s4, # pc d0 input
    output:
        d0=directory("../../data/processed/macs2/221005/Pc_d0"),
        d7=directory("../../data/processed/macs2/221005/Pc_d7")
    threads: 12
    params:
        p="-f BAMPE -g 7.4e6 --SPMR --qvalue 0.05 --keep-dup all"
    run:
        shell("macs3 callpeak -t {input.s1} -c {input.s2} --outdir {output.d7} {params.p} -n Pc_A_PA_d7")
        shell("macs3 callpeak -t {input.s3} -c {input.s4} --outdir {output.d0} {params.p} -n Pc_A_PA_d0")
