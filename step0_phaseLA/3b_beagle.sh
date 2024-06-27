#!/bin/bash

# create plink format map from references/chr22.b37.gmap.gz
zcat references/chr22.b37.gmap.gz | \
	awk 'BEGIN {OFS="\t"} NR > 1 {print $2, ".", $3, $1}' | \
	gzip > \
	references/chr22.b37.plink.gmap.gz

[ -d phaseLA ] || mkdir phaseLA

beagle \
	gt=admixed_cohort/ASW.unphased_mod1.vcf.gz \
	ref=references/TGP_HGDP_QC_hg19_chr22.vcf.gz \
	map=references/chr22.b37.plink.gmap.gz \
	out=phaseLA/ASW.phased.beagle \
	chrom=22 \
	impute=false \
	seed=0
