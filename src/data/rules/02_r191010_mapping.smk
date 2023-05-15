
####
##

# Snakefile or compute the ste
rule coverage_191010:
    input:
        ca="../../data/processed/mapping/CA.dr.bam",  # see Snakefile_2 (r191010)
        cc="../../data/processed/mapping/CC.dr.bam",   # see Snakefile_2 (r191010)
        cp="../../data/processed/mapping/CP.dr.bam",  # see Snakefile_2 (r191010)
    params:
        b="50", norm="BPM",  pmgs="7451359", pcgs="7661456", f="bigwig"
    output:
        ca="../../data/processed/mapping/CA.bw",
        cc="../../data/processed/mapping/CC.bw",
        cp="../../data/processed/mapping/CP.bw", 
    threads: 6
    run:
        shell("bamCoverage -p {threads} -b {input.ca} -o {output.ca} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.cc} -o {output.cc} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} -of {params.f} --centerReads")
        shell("bamCoverage -p {threads} -b {input.cp} -o {output.cp} --binSize {params.b} --normalizeUsing {params.norm} --effectiveGenomeSize {params.pmgs} -of {params.f} --centerReads")
