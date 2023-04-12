# QC3
rule seqkit_stats_decontam:
    input:
        script="workflow/scripts/seqkit_decontam.sh",
        reads=expand("resources/reads/trimmed/decontam/{sample}.fastq.gz", sample=SAMPLES),
    output:
        "results/qc/seqkit3/seqkit_stats.txt",
    threads: 1
    shell:
        "bash {input.script}"




