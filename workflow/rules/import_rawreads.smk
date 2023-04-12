# Import reads

rule import_rawreads:
    output:
        reads=expand("{outdir}/{sample}.fastq.gz", outdir=OUTDIR, sample=SAMPLES),
    shell:
        "bash workflow/scripts/import_rawreads.sh"