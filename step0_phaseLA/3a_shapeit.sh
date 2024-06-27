#!/bin/bash

[ -d phaseLA ] || mkdir phaseLA

shapeit4 \
	--input admixed_cohort/ASW.unphased_mod1.vcf.gz \
	--reference references/TGP_HGDP_QC_hg19_chr22.vcf.gz \
	--region 22 \
	--map references/chr22.b37.gmap.gz \
	--output phaseLA/ASW.phased.shapeit.vcf.gz \
	--seed 0
