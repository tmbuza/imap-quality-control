# QC1
rule seqkit_stats_raw:
    input:
        script="workflow/scripts/seqkit_raw.sh",
        read=expand("resources/reads/{accession}_{sraNum}.fastq.gz", accession=ACCESSIONS, sraNum=config["sraNum"]),
    output:
        "results/qc/seqkit1/seqkit_stats.txt",
    threads: 1
    shell:
        "bash {input.script}"

rule fastqc_raw:
    input:
        script="workflow/scripts/fastqc_raw.sh",
        reads=expand("resources/reads/{accession}_{sraNum}.fastq.gz", accession=ACCESSIONS, sraNum=config["sraNum"]),
    output:
        html=expand("results/qc/fastqc1/{accession}_{sraNum}_fastqc.html", accession=ACCESSIONS, sraNum=config["sraNum"]),
        zip=expand("results/qc/fastqc1/{accession}_{sraNum}_fastqc.zip", accession=ACCESSIONS, sraNum=config["sraNum"]),
    threads: 1
    shell:
        "bash {input.script}"

rule multiqc_raw:
    input:
        script="workflow/scripts/multiqc_raw.sh",
        zip=rules.fastqc_raw.output.zip,
    output:
        "results/qc/multiqc1/multiqc_report.html",
        report("results/qc/multiqc1/multiqc_plots/svg/mqc_fastqc_per_base_sequence_quality_plot_1.svg", caption="report/multiqc1.rst", category="MultiQC 1"),
    threads: 1
    shell:
        "bash {input.script}"

# Trim raw reads
rule bbduk_trim_reads:
    input:
        script="workflow/scripts/bbduk_trim.sh", 
        rawreads=expand("resources/reads/{accession}_{sraNum}.fastq.gz", accession=ACCESSIONS, sraNum=config["sraNum"]),
    output:
        trim=expand("resources/reads/trimmed/{accession}_{sraNum}.fastq.gz", accession=ACCESSIONS, sraNum=config["sraNum"]),
    shell:
        "bash {input.script}"


# Decontaminate trimmed reads
rule bbduk_decontam:
    input:
        script="workflow/scripts/bbduk_decontam.sh",    
        trim=expand("resources/reads/trimmed/{accession}_{sraNum}.fastq.gz", accession=ACCESSIONS, sraNum=config["sraNum"]),
    output:
        decont=expand("resources/reads/trimmed/decontam/{accession}_{sraNum}.fastq.gz", accession=ACCESSIONS, sraNum=config["sraNum"]),
    shell:
        "bash {input.script}"


# QC2
rule seqkit_stats_trimmed:
    input:
        script="workflow/scripts/seqkit_trim.sh",
        reads=expand("resources/reads/trimmed/{accession}_{sraNum}.fastq.gz", accession=ACCESSIONS, sraNum=config["sraNum"]),
    output:
        "results/qc/seqkit2/seqkit_stats.txt",
    threads: 1
    shell:
        "bash {input.script}"

rule fastqc_trimmed:
    input:
        script="workflow/scripts/fastqc_trim.sh",
        reads=expand("resources/reads/trimmed/{accession}_{sraNum}.fastq.gz", accession=ACCESSIONS, sraNum=config["sraNum"]),
    output:
        html=expand("results/qc/fastqc2/{accession}_{sraNum}_fastqc.html", accession=ACCESSIONS, sraNum=config["sraNum"]),
        zip=expand("results/qc/fastqc2/{accession}_{sraNum}_fastqc.zip", accession=ACCESSIONS, sraNum=config["sraNum"]),
    threads: 1
    shell:
        "bash {input.script}"

rule multiqc_trimmed:
    input:
        script="workflow/scripts/multiqc_trim.sh",
        zip=rules.fastqc_trimmed.output.zip,
    output:
        "results/qc/multiqc2/multiqc_report.html",
        report("results/qc/multiqc2/multiqc_plots/svg/mqc_fastqc_per_base_sequence_quality_plot_1.svg", caption="report/multiqc2.rst", category="MultiQC 2"),
    threads: 1
    shell:
        "bash {input.script}"

# QC3
rule seqkit_stats_decontam:
    input:
        script="workflow/scripts/seqkit_decontam.sh",
        reads=expand("resources/reads/trimmed/decontam/{accession}_{sraNum}.fastq.gz", accession=ACCESSIONS, sraNum=config["sraNum"]),
    output:
        "results/qc/seqkit3/seqkit_stats.txt",
    threads: 1
    shell:
        "bash {input.script}"

rule fastqc_decontam:
    input:
        script="workflow/scripts/fastqc_decontam.sh",
        reads=expand("resources/reads/trimmed/decontam/{accession}_{sraNum}.fastq.gz", accession=ACCESSIONS, sraNum=config["sraNum"]),
    output:
        html=expand("results/qc/fastqc3/{accession}_{sraNum}_fastqc.html", accession=ACCESSIONS, sraNum=config["sraNum"]),
        zip=expand("results/qc/fastqc3/{accession}_{sraNum}_fastqc.zip", accession=ACCESSIONS, sraNum=config["sraNum"]),
    threads: 1
    shell:
        "bash {input.script}"

rule multiqc_decontam:
    input:
        script="workflow/scripts/multiqc_decontam.sh",
        zip=rules.fastqc_decontam.output.zip,
    output:
        html="results/qc/multiqc3/multiqc_report.html",
        svg=report("results/qc/multiqc3/multiqc_plots/svg/mqc_fastqc_per_base_sequence_quality_plot_1.svg", caption="report/multiqc3.rst", category="MultiQC 3"),
    threads: 1
    shell:
        "bash {input.script}"



