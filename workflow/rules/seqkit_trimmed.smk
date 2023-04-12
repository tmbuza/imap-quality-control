# QC2
rule seqkit_stats_trimmed:
    input:
        reads=expand("resources/reads/trimmed/{sample}.fastq.gz", sample=SAMPLES),
    output:
        "results/qc/seqkit2/seqkit_stats.txt",
    threads: 1
    shell:
        "bash workflow/scripts/seqkit_trim.sh"

