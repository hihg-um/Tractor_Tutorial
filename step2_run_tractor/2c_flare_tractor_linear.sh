#!/bin/bash

[ -d results ] || mkdir results

../Tractor/scripts/run_tractor.R \
	--hapdose tracts/ASW.flare.anc \
	--phenofile phenotype/Phe.txt \
	--covarcollist none \
	--method linear \
	--output results/ASW_flare_linear_sumstats.txt
