#!/bin/bash

# If you have LA output from Flare, you will need the .anc.vcf.gz file
# Here we run `../Tractor/scripts/extract_tracts_flare.py`

[ -d tracts ] || mkdir tracts

../Tractor/scripts/extract_tracts_flare.py \
	--vcf phaseLA/ASW.flare.anc.vcf.gz \
	--num-ancs 2 \
	--output-dir tracts
