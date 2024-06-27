# step1_extract_tracts

In this first step of Tractor, dosage and ancestry files are created from the phase/LA files created in step0.

The python script will output 2 files per ancestry, creating 2*N files for N ancestries. In both RFMix and Flare, there is a numerical mapping for the ancestries provided in the local ancestry reference panel. For example, you may have 0=AFR & 1=EUR like in this example. This number will be used throughout Tractor to denote the specific ancestry is it mapped to. In this step, there will be output files such as `*anc0.dosage.txt` & `*anc0.hapcount.txt`. For this data, we know that anc0 is referring to African ancestry.

## *.dosage.txt

The dosage files will provide the number of alternate alleles corresponding to the ancestry of that particular file.

#### Logic -
At any given marker for any given sample, if for $ancN$,

$a_1=
\begin{cases} 
0 & \text{when } AN1 \neq N \\
1 & \text{when } AN1 = N 
\end{cases}$

$a_2=
\begin{cases} 
0 & \text{when } AN2 \neq N \\
1 & \text{when } AN2 = N 
\end{cases}$

$dosage_{ancN}=a_1*hap_{left}+a_2*hap_{right}$

#### Examples -

GT=0|1, AN1=0, AN2=1
- $dosage_{anc0}=1*0+0*1=\textbf{0}$
- $dosage_{anc1}=0*0+1*1=\textbf{1}$

GT=1|1, AN1=1, AN2=1
- $dosage_{anc0}=0*1+0*1=\textbf{0}$
- $dosage_{anc1}=1*1+1*1=\textbf{2}$

GT=0|0, AN1=0, AN2=0
- $dosage_{anc0}=1*0+1*0=\textbf{0}$
- $dosage_{anc1}=0*0+0*0=\textbf{0}$

## *.hapcount.txt

The hapcount files track the aggregation of ancestral copies, independent of the genotype.

#### Logic -
At any given marker for any given sample, if for $ancN$,

$a_1=
\begin{cases} 
0 & \text{when } AN1 \neq N \\
1 & \text{when } AN1 = N 
\end{cases}$

$a_2=
\begin{cases} 
0 & \text{when } AN2 \neq N \\
1 & \text{when } AN2 = N 
\end{cases}$

$hapcount_{ancN}=a_1+a_2$

#### Examples -

GT=0|1, AN1=0, AN2=1
- $hapcount_{anc0}=1+0=\textbf{1}$
- $hapcount_{anc1}=0+1=\textbf{1}$

GT=1|1, AN1=1, AN2=1
- $hapcount_{anc0}=0+0=\textbf{0}$
- $hapcount_{anc1}=1+1=\textbf{2}$

GT=0|0, AN1=0, AN2=0
- $hapcount_{anc0}=1+1=\textbf{2}$
- $hapcount_{anc1}=0+0=\textbf{0}$

## Running step1

The output from step0 is contained in this directory in a tar archive. It has both the rfmix results and flare results for testing.

`1_untar_step0_res.sh` can be used to access these results without needing to run step0.

Alternatively, the `phaseLA` directory can be moved here from step0 to run this step as well.

### RFMix

`2a_rfmix_tracts.sh`

#### Output:
- `tracts/ASW.phased.shapeit.*.dosage.txt`
- `tracts/ASW.phased.shapeit.*.hapcount.txt`

Note, this step automatically takes the root of the input vcf (here it is from shapeit) and uses that as the root for the output files.

### Flare

`2b_flare_tracts.sh`

#### Output
- `tracts/ASW.flare.anc.*.dosage.txt`
- `tracts/ASW.flare.anc.*.hapcount.txt`
