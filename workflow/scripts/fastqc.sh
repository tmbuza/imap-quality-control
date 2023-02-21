
#!/bin/bash

echo PROGRESS: FastQC - Getting read quality scores.

INPUTDIR="resources/reads"
FASTQC="results/qc/fastqc1"
mkdir -p "${FASTQC}"
fastqc "${INPUTDIR}"/*.fastq -o "${FASTQC}"

INPUTDIR="resources/reads/trimmed/"
FASTQC="results/qc/fastqc2"
mkdir -p "${FASTQC}"
fastqc "${INPUTDIR}"/*.fastq -o "${FASTQC}"

INPUTDIR="resources/reads/trimmed/decontam"
FASTQC="results/qc/fastqc3"
mkdir -p "${FASTQC}"
fastqc "${INPUTDIR}"/*.fastq -o "${FASTQC}"
