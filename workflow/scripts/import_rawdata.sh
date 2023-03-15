#!/bin/bash

# Creating basic variables
INPUTDIR="../imap-sample-metadata/data/test"
OUTDIR="resources/reads"

###############################
echo PROGRESS: "Importing metadata"
###############################

mkdir -p "${OUTDIR}"

cp "${INPUTDIR}"/*.gz "${OUTDIR}"/
