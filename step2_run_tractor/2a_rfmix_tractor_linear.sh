#!/bin/bash

[ -d results ] || mkdir results

../Tractor/scripts/run_tractor.R \
	--hapdose tracts/ASW.phased.shapeit \
	--phenofile phenotype/Phe.txt \
	--covarcollist none \
	--method linear \
	--output results/ASW_rfmix_linear_sumstats.txt
