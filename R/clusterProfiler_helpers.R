#' Prepares geneList inputs for clusterProfiler ORA
#'
#' This function reads differential gene expression results and performs GO enrichment
#' analysis using the clusterProfiler package.
#'
#' @param dgea_res_file character. Path to the DGEA result file (.csv, .tsv, or .txt).
#' @param pValCutoff numeric. Adjusted p-value cutoff to filter significantly differentially expressed genes. Default is 0.05.
#' @param pValCol character. Name of the column in the DGEA file that contains adjusted p-values (e.g., "padj"). Default is "padj".
#' @param log2FCCutoff numeric. log2FC cutoff to filter significantly differentially expressed genes. Default is 1.
#' @param log2FCCol character. Name of the column in the DGEA file that contains log2FoldChange (e.g., "log2FC" or "log2FoldChange"). Default is "log2FoldChange".
#' @param geneID_fromType character. Gene ID type in DGEA results. Default is "SYMBOL". 
#' @param geneID_toType character. Gene ID type to convert to. Default is "SYMBOL".
#' @param org character. Organism database to use for conversion (e.g., "org.Hs.eg.db"). Default is "org.Hs.eg.db".
#'
#' @return A list with gene vectors: all genes, significantly upregulated, and significantly downregulated.
#' 
#' @importFrom dplyr filter
#' @importFrom rlang sym
#' @importFrom clusterProfiler bitr
#' @importFrom utils read.csv read.delim
#' @importFrom magrittr %>%
#' 
#' @examples
#' # result <- prepare_clusterProfiler_geneLists("deseq2_results.csv", 0.05, "padj")
#'
#' @name prepare_clusterProfiler_geneLists
#' @export
prepare_clusterProfiler_geneLists <- function(dgea_res_file, pValCutoff = 0.05, pValCol = "padj", 
                                              log2FCCutoff = 1, log2FCCol = "log2FoldChange", 
                                              geneID_fromType = "SYMBOL", geneID_toType = "SYMBOL", org = "org.Hs.eg.db"){
  
  if(grepl(pattern = "\\.txt$|\\.tsv$", dgea_res_file)){
    res <- read.delim(dgea_res_file, row.names = 1)
  }
  else if(grepl(pattern = "\\.csv$", dgea_res_file)){
    res <- read.csv(dgea_res_file, row.names = 1)
  }
  else{
    stop("Error: Unsupported file type. Please provide a .txt or .csv file ")
  }
  # subset DGEA results for significant upregulated and downregualted genes 
  sig_res <- res %>% filter(!!rlang::sym(pValCol) < pValCutoff & abs(!!rlang::sym(log2FCCol)) > log2FCCutoff)
  
  gene_up <- sig_res %>% filter(!!rlang::sym(log2FCCol) > 0)
  gene_down <- sig_res %>% filter(!!rlang::sym(log2FCCol) < 0)
  
  
  geneList <- rownames(res)
  gene_up <- rownames(gene_up)
  gene_down <- rownames(gene_down)
  
  if(geneID_fromType != geneID_toType){
    geneList <- bitr(geneID = geneList, fromType = geneID_fromType, toType = geneID_toType, OrgDb = org)[[geneID_toType]]
    gene_up <-  bitr(geneID = gene_up, fromType = geneID_fromType, toType = geneID_toType, OrgDb = org)[[geneID_toType]]
    gene_down <-  bitr(geneID = gene_down, fromType = geneID_fromType, toType = geneID_toType, OrgDb = org)[[geneID_toType]]
  }
  
  return(list(geneList = geneList, gene_up = gene_up, gene_down = gene_down))
}

