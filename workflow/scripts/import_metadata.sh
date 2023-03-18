#!/bin/bash

# Creating basic variables
INPUTDIR="../imap-sample-metadata/data/metadata/metadata.csv"
OUTDIR="resources/metadata"

###############################
echo PROGRESS: "Importing metadata from imap-sample-metadata""
###############################

mkdir -p "${OUTDIR}"

cp "${INPUTDIR}" "${OUTDIR}"/metadata.csv


