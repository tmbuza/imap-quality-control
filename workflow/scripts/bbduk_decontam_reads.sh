#!/bin/bash

echo PROGRESS: Read decontamination
cd resources/reads/trimmed
for i in `ls -1 *_1.fastq | sed 's/_1.fastq//'`
  do
  bbduk.sh -Xmx3g \
    in1=$i\_1.fastq \
    in2=$i\_2.fastq \
    out1=decontam/$i\_1.fastq \
    out2=decontam/$i\_2.fastq \
    k=31 \
    hdist=1 \
    overwrite=True
  done

