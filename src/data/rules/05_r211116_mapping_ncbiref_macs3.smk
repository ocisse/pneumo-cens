####
include: "02_r211116_mapping_ncbiref.smk"
# P2C ncbi ref
rule callpeak:
    input:
        s2=rules.mark_dup211116_rep.output.s2, # mis12 ab1
        s3=rules.mark_dup211116_rep.output.s3, # mis12 pis1
        s4=rules.mark_dup211116_rep.output.s4, # mis12 ab2
        s5=rules.mark_dup211116_rep.output.s5, # mis12 pis2
        s6=rules.mark_dup211116_rep.output.s6, # input (no ab)
        s7=rules.mark_dup211116_rep.output.s7, # H3k9me2
        s8=rules.mark_dup211116_rep.output.s8, # h3k4me2
    
    output:
        s2=directory("../../data/processed/macs2/211116/s2"),
        s4=directory("../../data/processed/macs2/211116/s4"),
        s7=directory("../../data/processed/macs2/211116/s7"),
        s8=directory("../../data/processed/macs2/211116/s8"),
        
    threads: 12
    params:
        p="-f BAMPE -g 8.2e6 --SPMR --qvalue 0.05 --keep-dup all"
    run:
        shell("macs3 callpeak -t {input.s2} -c {input.s3} --outdir {output.s2} {params.p} -n S2")
        shell("macs3 callpeak -t {input.s4} -c {input.s5} --outdir {output.s4} {params.p} -n S4")
        shell("macs3 callpeak -t {input.s7} -c {input.s6} --nomodel --extsize 147 --broad --broad-cutoff 0.1 --outdir {output.s7} -n S7")
        shell("macs3 callpeak -t {input.s8} -c {input.s6} --nomodel --extsize 147 --broad --broad-cutoff 0.1 --outdir {output.s8} -n S8")
