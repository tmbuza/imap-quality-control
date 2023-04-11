#!/bin/bash

echo PROGRESS: Getting stats of the raw reads.

# INPUTDIR="resources/test"
# SEQKIT="results/qc/seqkit1"
# mkdir -p "${SEQKIT}"
# seqkit stat "${INPUTDIR}"/*.fastq.gz >"${SEQKIT}"/seqkit_stats.txt


# INPUTDIR="resources/reads"

INPUTDIR="resources/test"
# SEQKIT="results/qc/seqkit1"
SEQKIT="results/seqkit1"
mkdir -p "${SEQKIT}"
# seqkit stat "${INPUTDIR}"/*.fastq.gz >"${SEQKIT}"/seqkit_stats.txt
seqkit stat "${INPUTDIR}"/*.fastq.gz >"${SEQKIT}"/seqkit_stats.txt

