---
title: "Python QTL"
---
<<<<<<< HEAD
=======

# Please SEE https://github.com/dblhlx/PyBSASeq for where the python script came frome and who developed it. In this tutorial I develop a generic parser in R which produces an CSV file used as an argument when calling python script PyBSASeq.py. It is another method to perform a Quantitative Trait Locus analysis. 


>>>>>>> b7cc769e11252791d93d46ca16a77885ab87228a
```{r QTL}
devtools::install_github("PBGLMichaelHall/Py_QTL_Parser",force = TRUE)
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
<<<<<<< HEAD
 
![TerminalOutput](https://github.com/PBGLMichaelHall/Py_QTL_Parser/blob/main/extdata/TerminalOutput.png)
 
=======


>>>>>>> b7cc769e11252791d93d46ca16a77885ab87228a
```
![TerminalOutput](https://user-images.githubusercontent.com/93121277/156781414-34d8517f-10cc-4bf7-bc2a-f09bb1f2b678.png)
![PYQTL](https://user-images.githubusercontent.com/93121277/156782187-5c642bbb-a09a-4b62-84f0-cd44857c2c07.png)
