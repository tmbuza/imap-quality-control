#!/bin/bash

echo PROGRESS: Read decontamination

cd resources/reads/trimmed
for i in *.fastq.gz 
  do
  bbduk.sh -Xmx3g \
    in1=$i \
    out1=decontam/$i \
    outm1=decontam/matchedphix/$i \
    ref=~/bbmap/resources/phix174_ill.ref.fa.gz \
    k=25 \
    hdist=1 \
    # qhist=images/qhist.png \
    # bqhist=images/bqhist.png \
    # enthist=images/enthist.png \
    # aqhist=images/aqhist.png \
    overwrite=True
  done

