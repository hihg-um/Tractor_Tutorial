# step0_phaseLA

This is the preprocessing step prior to running Tractor phase a VCF file and run Local Ancestry Inference.

There is a 4-step script set to complete this task. Including here are option (a) and option (b) to phase with `shapeit` and LA with `rfmix` or to phase with `beagle` and LA with `flare`. The output files for rfmix and flare are different, and currently are the only supported input types for the first step of Tractor. Both will work, but Flare seems to do a better job handling the computation of larger-scale data.

## Running step0

### SHAPEIT/RFMix

`1_download_data.sh`

`2_add_tags.sh`

`3a_shapeit.sh`

`4a_rfmix.sh`

#### Output:
- `phaseLA/ASW.phased.shapeit.vcf.gz`
- `phaseLA/ASW.deconvoluted*`

### Beagle/Flare

`1_download_data.sh`

`2_add_tags.sh`

`3b_beagle.sh`

`4b_flare.sh`

#### Output:
- `phaseLA/ASW.phased.beagle.vcf.gz`
- `phaseLA/ASW.flare.anc.vcf.gz`
