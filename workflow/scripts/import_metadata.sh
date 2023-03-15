#!/bin/bash

# Creating basic variables
INPUTDIR="../imap-sample-metadata/data/metadata/PRJNA322554_tidy_metadata.csv"
OUTDIR="resources/metadata"

###############################
echo PROGRESS: "Importing metadata"
###############################

mkdir -p "${OUTDIR}"

cp "${INPUTDIR}" "${OUTDIR}"/metadata.csv


