#!/bin/bash

echo PROGRESS: Getting stats and read quality scores of decontaminated reads.

INPUTDIR="resources/reads"
SEQKIT="results/qc/seqkit1"
FASTQC="results/qc/fastqc1"
MULTIQC="results/qc/multiqc1"
mkdir -p "${SEQKIT}" "${FASTQC}" "${MULTIQC}"

seqkit stat "${INPUTDIR}"/*.fastq >"${SEQKIT}"/seqkit_stats.txt
fastqc "${INPUTDIR}"/*.fastq -o "${FASTQC}"
multiqc --force --data-dir "${FASTQC}" -o "${MULTIQC}" --export
echo PROGRESS: Getting stats and read quality scores of decontaminated reads.

INPUTDIR="resources/reads/trimmed"
SEQKIT="results/qc/seqkit2"
FASTQC="results/qc/fastqc2"
MULTIQC="results/qc/multiqc2"
mkdir -p "${SEQKIT}" "${FASTQC}" "${MULTIQC}"

seqkit stat "${INPUTDIR}"/*.fastq >"${SEQKIT}"/seqkit_stats.txt
fastqc "${INPUTDIR}"/*.fastq -o "${FASTQC}"
multiqc --force --data-dir "${FASTQC}" -o "${MULTIQC}" --export
echo PROGRESS: Getting stats and read quality scores of decontaminated reads.

INPUTDIR="resources/reads/trimmed/decontam"
SEQKIT="results/qc/seqkit3"
FASTQC="results/qc/fastqc3"
MULTIQC="results/qc/multiqc3"
mkdir -p "${SEQKIT}" "${FASTQC}" "${MULTIQC}"

seqkit stat "${INPUTDIR}"/*.fastq >"${SEQKIT}"/seqkit_stats.txt
fastqc "${INPUTDIR}"/*.fastq -o "${FASTQC}"
multiqc --force --data-dir "${FASTQC}" -o "${MULTIQC}" --export

