#!/bin/bash

# If you have LA output from RFMix, you will need the msp.tsv file
# Here we run `../Tractor/scripts/extract_tracts.py`

[ -d tracts ] || mkdir tracts

../Tractor/scripts/extract_tracts.py \
	--vcf phaseLA/ASW.phased.shapeit.vcf.gz \
	--msp phaseLA/ASW.deconvoluted.msp.tsv \
	--num-ancs 2 \
	--output-dir tracts
