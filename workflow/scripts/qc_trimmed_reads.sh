#!/bin/bash


echo PROGRESS: Getting stats and read quality scores 

INPUTDIR="resources/trimmed"
SEQKIT="results/qc/seqkit2"
FASTQC="results/qc/fastqc2"
MULTIQC="results/qc/multiqc2"
mkdir -p "${SEQKIT}" "${FASTQC}" "${MULTIQC}"

seqkit stat "${INPUTDIR}"/*.fastq >"${SEQKIT}"/seqkit_stats.txt
fastqc "${INPUTDIR}"/*.fastq -o "${FASTQC}"
multiqc --force --data-dir "${FASTQC}" -o "${MULTIQC}" --export
