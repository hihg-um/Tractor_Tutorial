#!/bin/bash

[ -d results ] || mkdir results

../Tractor/scripts/run_tractor.R \
	--hapdose tracts/ASW.phased.shapeit \
	--phenofile phenotype/Phe2.txt \
	--covarcollist none \
	--method logistic \
	--output results/ASW_rfmix_logistic_sumstats.txt
