#!/bin/bash

# Creating basic variables
INPUTDIR="../imap-requirements/resources"
OUTDIR="resources"


###############################
echo PROGRESS: "Preparing resouces for QC"
###############################

mkdir -p "${OUTDIR}"

cp -r "${INPUTDIR}"/* "${OUTDIR}"/
