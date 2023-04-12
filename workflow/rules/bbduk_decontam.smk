# Decontaminate trimmed reads
rule bbduk_decontam:
    input:
        trim=expand("resources/reads/trimmed/{sample}.fastq.gz", sample=SAMPLES),
    output:
        decont=expand("resources/reads/trimmed/decontam/{sample}.fastq.gz", sample=SAMPLES),
    shell:
        "bash workflow/scripts/bbduk_decontam.sh"
