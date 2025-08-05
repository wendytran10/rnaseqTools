# rnaseqTools

This repository contains helper functions for performing GSEA and other RNA-seq downstream analyses in R.

## Installation

You can install the development version directly from GitHub using:

```r
# install.packages("devtools")
devtools::install_github("wendytran10/rnaseqTools")
```
## Example usage
## Function: `prepare_clusterProfiler_geneLists()`

This function processes DGEA results and prepares gene lists for enrichment analysis using `clusterProfiler`.

```r
cp_inputs <- prepare_clusterProfiler_geneLists(
  dgea_res_file = "results.csv",
  pValCutoff = 0.05,
  pValCol = "pvalue",
  geneID_fromType = "SYMBOL",
  geneID_toType = "ENTREZID"
)
```
