# step2_run_tractor

This is the second and final step of Tractor where the tracts from step1 are used to run a linear or logistic regression model, depending on the phenotype data.

## The Model

It is important to understand the model being run. As described in the Tractor paper, here is a breakdown of GWAS, Admixture Mapping & Tractor. 

### GWAS

$y \sim b_{0} + b_{1}X_{1} + ... + b_{N}X_{N}$

where $b$ represents effect estimates, $X_{1}$ represents alternate allele dosage for each sample (summation of all _dosage.txt_ files), and $X_{2}-X_{N}$ are other covariates

### Admixture Mapping

$y \sim b_{0} + b_{1}X_{1} + ... + b_{N}X_{N}$

where $b$ represents effect estimates, $X_{1}$ represents the aggregation of ancestral copies for each sample (_hapcount.txt_ files), and $X_{2}-X_{N}$ are other covariates

### Tractor

$y \sim b_{0} + b_{1}X_{1} + b_{2}X_{2} + b_{3}X_{3} + ... + b_{N}X_{N}$

where $b$ represents effect estimates, $X_{1}$ is the Admixture Mapping term (_anc0.hapcount.txt_), $X_{2}$ is the anc0 GWAS term (_anc0.dosage.txt_) and $X_{3}$ is the anc1 GWAS term (_anc1.dosage.txt_) and $X_{4}-X_{N}$ are other covariates

## Tractor Output

When translating to the Tractor output files, the terms are coded like this -

$X_{1} \Leftrightarrow$ `LAeff_anc0`

$X_{2} \Leftrightarrow$ `beta_anc0`

$X_{3} \Leftrightarrow$ `beta_anc1`

Additionally, the [official Tractor Tutorial](https://github.com/Atkinson-Lab/Tractor-tutorial/blob/main/Local.md#run-tractor-locally) provides the following description for each output variable -

```
CHR             Chromosome 
POS             Position 
ID              SNP ID
REF             Reference allele
ALT             Alternate allele
N               Total sample size

AF_anc0         Allele frequency for anc0; sum(dosage)/sum(local ancestry)
LAprop_anc0     Local ancestry proportion for anc0; sum(local ancestry)/2 * sample size
beta_anc0       Effect size for alternate alleles inherited from anc0
se_anc0         Standard error for effect size (beta_anc0)
pval_anc0       p-value for alternate alleles inherited from anc0 (NOT -log10(pvalues))
tval_anc0       t-value for anc0

AF_anc1         Allele frequency for anc1; sum(dosage)/sum(local ancestry)
LAprop_anc1     Local ancestry proportion for anc1; sum(local ancestry)/2 * sample size
beta_anc1       Effect size for alternate alleles inherited from anc1
se_anc1         Standard error for effect size (beta_anc1)
pval_anc1       p-value for alternate alleles inherited from anc1 (NOT -log10(pvalues))
tval_anc1       t-value for anc1

LApval_anc0     p-value for the local ancestry term (X1 term in Tractor)
LAeff_anc0      Effect size for the local ancestry term (X1 term in Tractor)
```

## Running step2

Similarly to step1, the output from step1 is contained here in a tar archive. This also contains the `phenotype/` directory needed to run this step. If you have been running each step on your own, the `phenotype` directory would also have been downloaded during step0 in the data download.

`1_untar_step1_res.sh` can be used to access these results (and phenotype dir) without needing to run step1.

Depending on the ancestry program & phenotype file (y -> quantitative or nominal), one of the 4 run tractor scripts can be used.

`2a_rfmix_tractor_linear.sh`

`2b_rfmix_tractor_logistic.sh`

`2c_flare_tractor_linear.sh`

`2d_flare_tractor_logistic.sh`


## Example Output (from Flare Logistic)

| CHR | POS      | ID | REF | ALT | N  | AF_anc0    | LAprop_anc0 | beta_anc0   | se_anc0    | pval_anc0           | tval_anc0 | AF_anc1    | LAprop_anc1 | beta_anc1 | se_anc1  | pval_anc1           | tval_anc1 | LApval_anc0         | LAeff_anc0 |
|-----|----------|----|-----|-----|----|------------|-------------|-------------|------------|---------------------|-----------|------------|-------------|-----------|----------|---------------------|-----------|---------------------|------------|
| 22  | 16378659 | .  | G   | A   | 61 | 0.010638   | 0.770492    | 17.008607   | 1455.3976  | 0.990675677595377   | 0.0117    | 0          | 0.229508    |           |          |                     |           | 0.827084608627025   | -0.11743   |
| 22  | 16393312 | .  | G   | A   | 61 | 0.180851   | 0.770492    | -0.288999   | 0.6783     | 0.670039844063645   | -0.4261   | 0.071429   | 0.229508    | -15.38169 | 1696.7344 | 0.992766902592547   | -0.0091   | 0.993601454163077   | -0.004415  |
| 22  | 16394104 | .  | C   | T   | 61 | 0.021277   | 0.770492    | -15.302976  | 1696.7239  | 0.992803872004388   | -0.009    | 0          | 0.229508    |           |          |                     |           | 0.978459455896994   | -0.014307  |
| 22  | 16549261 | .  | T   | C   | 61 | 0.021277   | 0.770492    | -15.324911  | 1696.7344  | 0.992793601948876   | -0.009    | 0          | 0.229508    |           |          |                     |           | 0.928409234762974   | 0.047959   |
| 22  | 16549459 | .  | C   | T   | 61 | 0          | 0.770492    |             |            |                     |           | 0          | 0.229508    |           |          |                     |           | 0.986109284785356   | -0.009233  |
| 22  | 16554521 | .  | G   | A   | 61 | 0.148936   | 0.770492    | 1.280617    | 0.6488     | 0.048384485027127    | 1.974     | 0          | 0.229508    |           |          |                     |           | 0.625710230059407   | -0.275651  |
| 22  | 16554530 | .  | C   | T   | 61 | 0.010638   | 0.770492    | -14.303861  | 1455.3976  | 0.992158400026328    | -0.0098   | 0          | 0.229508    |           |          |                     |           | 0.9364498183429     | -0.042118  |
| 22  | 16554781 | .  | G   | C   | 61 | 0          | 0.770492    |             |            |                     |           | 0.035714   | 0.229508    | -14.303861| 1455.3976 | 0.992158400026328    | -0.0098   | 0.9364498183429     | -0.042118  |
| 22  | 16554886 | .  | C   | A   | 61 | 0          | 0.770492    |             |            |                     |           | 0          | 0.229508    |           |          |                     |           | 0.986109284785356   | -0.009233  |
| 22  | 16558329 | .  | T   | A   | 61 | 0.031915   | 0.770492    | 0.680445    | 1.295      | 0.599267110369708    | 0.5255    | 0          | 0.229508    |           |          |                     |           | 0.910159341736318   | -0.061048  |
