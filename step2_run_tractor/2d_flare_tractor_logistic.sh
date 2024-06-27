#!/bin/bash

[ -d results ] || mkdir results

../Tractor/scripts/run_tractor.R \
	--hapdose tracts/ASW.flare.anc \
	--phenofile phenotype/Phe2.txt \
	--covarcollist none \
	--method logistic \
	--output results/ASW_flare_logistic_sumstats.txt
