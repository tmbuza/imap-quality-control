
rule fastqc_trimmed:
    input:
        reads=expand("resources/reads/trimmed/{sample}.fastq.gz", sample=SAMPLES),
    output:
        html=expand("results/qc/fastqc2/{sample}_fastqc.html", sample=SAMPLES),
        zip=expand("results/qc/fastqc2/{sample}_fastqc.zip", sample=SAMPLES),
    threads: 1
    shell:
        "bash workflow/scripts/fastqc_trim.sh"
