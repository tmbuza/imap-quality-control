#!/bin/bash

# Creating basic variables
INPUTDIR="../imap-requirements/resources"
OUTDIR="resources"

###############################
echo PROGRESS: "Preparing resouces for Bioinformatics (IMAP-PART 2)"
###############################

mkdir -p "${OUTDIR}"

cp -r "${INPUTDIR}"/* "${OUTDIR}"/
