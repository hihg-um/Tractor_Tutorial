#!/bin/bash

[ -d phaseLA ] || mkdir phaseLA

# min-maf=0 & min-mac=0 to mimic the behavior of RFMix and retain all variants
# defaults are min-maf=0.005 & min-mac=50, so probably stick to those for real analyses
flare \
	gt=phaseLA/ASW.phased.beagle.vcf.gz \
	ref=references/TGP_HGDP_QC_hg19_chr22.vcf.gz \
	ref-panel=references/YRI_GBR_samplemap.txt \
	map=references/chr22.b37.plink.gmap.gz \
	out=phaseLA/ASW.flare \
	min-maf=0 \
	min-mac=0 \
	seed=0
