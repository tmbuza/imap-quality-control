#!/bin/bash

echo PROGRESS: Getting stats of the reads.

INPUTDIR="resources/reads"
SEQKIT="results/qc/seqkit1"
mkdir -p "${SEQKIT}"
seqkit stat "${INPUTDIR}"/*.fastq >"${SEQKIT}"/seqkit_stats.txt

INPUTDIR="resources/reads/trimmed"
SEQKIT="results/qc/seqkit2"
mkdir -p "${SEQKIT}"
seqkit stat "${INPUTDIR}"/*.fastq >"${SEQKIT}"/seqkit_stats.txt

INPUTDIR="resources/reads/trimmed/decontam"
SEQKIT="results/qc/seqkit3"
mkdir -p "${SEQKIT}"
seqkit stat "${INPUTDIR}"/*.fastq >"${SEQKIT}"/seqkit_stats.txt
