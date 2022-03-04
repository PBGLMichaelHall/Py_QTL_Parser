# Py_QTL_Parser
```{r QTL}
devtools::install_github("PBGLMichaelHall/QTLseqr",force = TRUE)
library(PyQTLParser)
library(vcfR)

setwd("/home/michael/Desktop/RiceCold/")

file <- "wGQ-freebayes~bwa~IRGSP-1.0~both-segregant_bulks~filtered-default.vcf.gz"

vcf <- read.vcfR(file)

VCF_TIDY <- vcfR2tidy(vcf)

Py_QTL_Parser(vcf = VCF_TIDY, HighBulk = "ET-pool-385", LowBulk = "ES-pool-430")

#Run this command in Terminal
 python PyBSASeq.py -i Hall.csv -o RiceCold -p F2 -b 430,385
 #Please refer to:
 https://github.com/dblhlx/PyBSASeq/tree/master/BulksOnly
 for more help
 #The analysis takes over 4 hours
```
