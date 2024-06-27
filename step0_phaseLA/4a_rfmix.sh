#!/bin/bash

[ -d phaseLA ] || mkdir phaseLA

rfmix \
	-f phaseLA/ASW.phased.shapeit.vcf.gz \
	-r references/TGP_HGDP_QC_hg19_chr22.vcf.gz \
	-m references/YRI_GBR_samplemap.txt \
	-g references/chr22.genetic_map.modified.txt \
	-o phaseLA/ASW.deconvoluted \
	--chromosome=22
