rule fastqc_raw:
    input:
        reads=expand("resources/reads/{sample}.fastq.gz", sample=SAMPLES),
    output:
        html=expand("results/qc/fastqc1/{sample}_fastqc.html", sample=SAMPLES),
        zip=expand("results/qc/fastqc1/{sample}_fastqc.zip", sample=SAMPLES),
    threads: 1
    shell:
        "bash workflow/scripts/fastqc_raw.sh"