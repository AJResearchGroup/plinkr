# Use cases

Here I collect use cases.

```
plink2 \
  --pgen  dosages/chr${​chr}​.pgen \
  --psam  /proj/sens2017538/nobackup/UKBB_IMP_DOSAGE_V3/ukb41143.fam \
  --pvar  dosages/chr${​chr}​.dedup.bim \
  --keep-females \
  --keep  /proj/sens2017538/nobackup/UKBB_IMP_DOSAGE_V3/IDs_to_indlude_NonRelCauc.ukb41143.20191202.txt \
  --pheno ../shbg.pheno \
  --covar ../cov.tsv \
  --covar-name array AGE BMI PC1-PC10 \
  --hwe 1e-20 \
  --glm hide-covar cols=+a1freq,+ax \
  --maf 0.01 \
  --geno 0.05 \
  --out females/chr${​chr}​
``` 

