# Trim raw reads
rule bbduk_trim_reads:
    input:
        script="workflow/scripts/bbduk_trim.sh", 
        rawreads=expand("resources/reads/{sample}.fastq.gz", sample=SAMPLES),
    output:
        trim=expand("resources/reads/trimmed/{sample}.fastq.gz", sample=SAMPLES),
    shell:
        "bash {input.script}"
