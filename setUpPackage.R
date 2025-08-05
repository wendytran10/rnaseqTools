# Set your working directory to the root of your project
setwd("~/Documents/GitHub/rnaseqTools/")

# Load helpful libraries
library(usethis)
library(devtools)

# Set active project (if not already)
usethis::proj_set("/Users/wendytran/Documents/GitHub/rnaseqTools")

# Recreate DESCRIPTION with correct package name
use_description(fields = list(
  Package = "rnaseqTools",
  Title = "RNA-seq Analysis Tools",
  Description = "Modular functions for downstream RNA-seq analysis including differential gene expression analysis (DGEA), gene set enrichment analysis (GSEA), etc.",
  Version = "0.1.0",
  Author = "Wendy Tran",
  Maintainer = "Wendy Tran <wendytntran@gmail.com>"
))

# Create NAMESPACE (auto-managed by roxygen2)
use_namespace()

# Add license (MIT is simple and permissive)
use_mit_license("Wendy Tran")

# Add a README
use_readme_md()

# Add testing infrastructure
use_testthat()