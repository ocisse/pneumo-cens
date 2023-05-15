####
include: "02_r220606_mapping.smk"

rule callpeak_narrow:
    input:
        s5=rules.mark_dup220606.output.s5, # pc d14 cenpa
        s6=rules.mark_dup220606.output.s6, # pc d14 cenpc
        s8=rules.mark_dup220606.output.s8, # pc input
        
    output:
        a=directory("../../data/processed/macs2/220606/Pc_d14_cenpa"),
        c=directory("../../data/processed/macs2/220606/Pc_d14_cenpc"),
    threads: 12
    params:
        p="-f BAMPE -g 7.4e6 --SPMR --qvalue 0.05 --keep-dup all"
    run:
        shell("macs3 callpeak -t {input.s5} -c {input.s8} --outdir {output.a} {params.p} -n Pc_A_Inp_d14")
        shell("macs3 callpeak -t {input.s6} -c {input.s8} --outdir {output.c} {params.p} -n Pc_C_Inp_d14")
