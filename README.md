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
