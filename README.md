<<<<<<< HEAD

# rnaseqTools

<!-- badges: start -->
<!-- badges: end -->

The goal of rnaseqTools is to provide useful functions to analyze RNA-seq data.

## Installation

You can install the development version of rnaseqTools from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("wendytran10/rna-seq-analysis")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(rnaseqTools)
## basic example code
```

=======
# RNA-seq Analysis Tools

This repository contains helper functions for performing GSEA and other RNA-seq downstream analyses in R.

## Function: `prepare_clusterProfiler_geneLists()`

This function processes DGEA results and prepares gene lists for enrichment analysis using `clusterProfiler`.

### Example usage

```r
cp_inputs <- prepare_clusterProfiler_geneLists(
  dgea_res_file = "results.csv",
  pValCutoff = 0.05,
  pValCol = "pvalue",
  geneID_fromType = "SYMBOL",
  geneID_toType = "ENTREZID"
)
>>>>>>> 22461ea1c816a6032bc94e015e2ec89acea39317
