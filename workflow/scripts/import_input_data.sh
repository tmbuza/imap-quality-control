#!/bin/bash

# Creating basic variables
METASOURCE="../imap-download-sra-reads/data/metadata/"
RAWDATA="../imap-download-sra-reads/data/test/"
OUTDIR="resources/reads"
METADIR="resources/metadata"

###############################
echo PROGRESS: "Preparing resouces for quality control"
###############################

mkdir -p "${OUTDIR}" "${METADIR}"

cp -r "${METASOURCE}"/metadata.csv "${METADIR}"/metadata.csv
cp -r "${RAWDATA}"/* "${OUTDIR}"/
