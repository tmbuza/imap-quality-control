# QC1
rule seqkit_stats_raw:
    input:
        read=expand("resources/reads/{sample}.fastq.gz", sample=SAMPLES),
    output:
        "results/qc/seqkit1/seqkit_stats.txt",
    threads: 1
    shell:
        "bash workflow/scripts/seqkit_raw.sh"