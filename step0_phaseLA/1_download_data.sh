#!/bin/bash

curl -O -L https://github.com/Atkinson-Lab/Tractor-tutorial/raw/main/tutorial-data.zip
unzip tutorial-data.zip
mv tutorial-data/admixed_cohort tutorial-data/references .
mv tutorial-data/phenotype ../step2_run_tractor/.
rmdir tutorial-data/
rm tutorial-data.zip
