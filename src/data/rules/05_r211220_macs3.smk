####
include: "02_r211220_mapping.smk"

rule callpeak:
    input:
        s19=rules.mark_dup211220.output.s19, # Pm cenpa
        s20=rules.mark_dup211220.output.s20, # input
        s21=rules.mark_dup211220.output.s21, # h3k9me2
        s22=rules.mark_dup211220.output.s22, # h3k9me3
        s23=rules.mark_dup211220.output.s23, # h3k4me2
    output:
        s19=directory("../../data/processed/macs2/211220/s19"),
        s21=directory("../../data/processed/macs2/211220/s21"),
        s22=directory("../../data/processed/macs2/211220/s22"),
        s23=directory("../../data/processed/macs2/211220/s23"),
        
        
    threads: 12
    params:
        p="-f BAMPE -g 7.4e6 --SPMR --qvalue 0.05 --keep-dup all"
    run:
        shell("macs3 callpeak -t {input.s19} -c {input.s20} --outdir {output.s19} {params.p} -n S19")
        shell("macs3 callpeak -t {input.s21} -c {input.s20} --nomodel --extsize 147 --broad --broad-cutoff 0.1 --outdir {output.s21} -n S21")
        shell("macs3 callpeak -t {input.s22} -c {input.s20} --nomodel --extsize 147 --broad --broad-cutoff 0.1 --outdir {output.s22} -n S22")
        shell("macs3 callpeak -t {input.s23} -c {input.s20} --nomodel --extsize 147 --broad --broad-cutoff 0.1 --outdir {output.s23} -n S23")
        
