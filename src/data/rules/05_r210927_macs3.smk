####
include: "02_r210927_mapping.smk"

rule callpeak_narrow:
    input:
        s1=rules.mark_dup210927.output.s1,
        s2=rules.mark_dup210927.output.s2,
        s3=rules.mark_dup210927.output.s3,
        s4=rules.mark_dup210927.output.s4,
        s5=rules.mark_dup210927.output.s5,
        s6=rules.mark_dup210927.output.s6,
        s7=rules.mark_dup210927.output.s7,
        s8=rules.mark_dup210927.output.s8,
    
    output:
        s1=directory("../../data/processed/macs2/210927/Pc_cenpa"),
        s2=directory("../../data/processed/macs2/210927/Pc_cenpc"),
        s3=directory("../../data/processed/macs2/210927/Pc_h3"),
        s4=directory("../../data/processed/macs2/210927/Pc_h4"),
        s6=directory("../../data/processed/macs2/210927/Pc_h3k9me2"),
        s7=directory("../../data/processed/macs2/210927/Pc_h3k9me3"),
        s8=directory("../../data/processed/macs2/210927/Pc_h3k4me2"), 
    threads: 12
    params:
        p="-f BAMPE -g 7.4e6 --SPMR --qvalue 0.05 --keep-dup all"
    run:
        shell("macs3 callpeak -t {input.s1} -c {input.s5} --outdir {output.s1} {params.p} -n Pc_A")
        shell("macs3 callpeak -t {input.s2} -c {input.s5} --outdir {output.s2} {params.p} -n Pc_C")
        shell("macs3 callpeak -t {input.s3} -c {input.s5} --outdir {output.s3} {params.p} -n Pc_H3")
        shell("macs3 callpeak -t {input.s4} -c {input.s5} --outdir {output.s4} {params.p} -n Pc_H4")
        shell("macs3 callpeak -t {input.s6} -c {input.s5} --outdir {output.s6} {params.p} -n Pc_H3K9me2")
        shell("macs3 callpeak -t {input.s7} -c {input.s5} --outdir {output.s7} {params.p} -n Pc_H3K9me3")
        shell("macs3 callpeak -t {input.s8} -c {input.s5} --outdir {output.s8} {params.p} -n Pc_H3K4me2")
