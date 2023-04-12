rule fastqc_decontam:
    input:
        reads=expand("resources/reads/trimmed/decontam/{sample}.fastq.gz", sample=SAMPLES),
    output:
        html=expand("results/qc/fastqc3/{sample}_fastqc.html", sample=SAMPLES),
        zip=expand("results/qc/fastqc3/{sample}_fastqc.zip", sample=SAMPLES),
    threads: 1
    shell:
        "bash workflow/scripts/fastqc_decontam.sh"
