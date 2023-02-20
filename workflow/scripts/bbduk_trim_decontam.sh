#!/bin/bash

echo PROGRESS: Read trimming
cd resources/reads

for i in `ls -1 *_1.fastq | sed 's/_1.fastq//'`
  do
  bbduk.sh -Xmx3g \
    in1=$i\_1.fastq \
    in2=$i\_2.fastq \
    out1=trimmed/$i\_1.fastq \
    out2=trimmed/$i\_2.fastq \
    k=31 \
    hdist=1 \
    overwrite=True
  done

cd trimmed
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

