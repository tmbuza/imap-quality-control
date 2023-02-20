#!/bin/bash


echo PROGRESS: Getting stats and read quality scores 

INPUTDIR="resources/reads"
SEQKIT="results/qc/seqkit1"
FASTQC="results/qc/fastqc1"
MULTIQC="results/qc/multiqc1"
mkdir -p "${SEQKIT}" "${FASTQC}" "${MULTIQC}"

seqkit stat "${INPUTDIR}"/*.fastq >"${SEQKIT}"/seqkit_stats.txt
fastqc "${INPUTDIR}"/*.fastq -o "${FASTQC}"
multiqc --force --data-dir "${FASTQC}" -o "${MULTIQC}" --export
