#!/bin/bash

# Add AC/AN tags in input file
bcftools +fill-tags admixed_cohort/ASW.unphased.vcf.gz \
	-Oz \
	-o admixed_cohort/ASW.unphased_mod1.vcf.gz \
	-- -t AN,AC

# Index file
bcftools index admixed_cohort/ASW.unphased_mod1.vcf.gz
