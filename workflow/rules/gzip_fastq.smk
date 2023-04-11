rule ifnot_gz_compress_fastq:
    input:
        fastq=expand("{outdir}/{sample}.fastq", outdir=OUTDIR, sample=SAMPLES),
    output:
        gzfq=expand("{outdir}/{sample}.fastq.gz", outdir=OUTDIR, sample=SAMPLES),
    params:
        outdir=OUTDIR,
    shell:
        """
        gzip -k data/reads/*.fastq
        """
	
