---
title: "Python QTL"
---
<<<<<<< HEAD
=======

# Please SEE https://github.com/dblhlx/PyBSASeq for where the python script came frome and who developed it. In this tutorial I develop a generic parser in R which produces an CSV file used as an argument when calling python script PyBSASeq.py. It is another method to perform a Quantitative Trait Locus analysis. 
######################################################################################################################################################



#########################################################################################################################################################
# For more efficient comupting of the algorithm please download Fisher's Exact Test.

```r
Installation

Within this folder :

git clone git://github.com/brentp/fishers_exact_test.git
pip install .

From PyPI :

pip install fisher

Or install the development version :

pip install git+git://github.com/brentp/fishers_exact_test.git
```


# For Read the Docs please visit:
https://py-qtl-parser.readthedocs.io/en/latest/Rice_BSA.html

# Rice Cold Tolerance:


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

# Sorghum Semi-Dwarfism:
```r

file <- "freebayes_D2.filtered.vcf"

vcf <- read.vcfR(file)

VCF_TIDY <- vcfR2tidy(vcf)

Py_QTL_Parser(vcf = VCF_TIDY, HighBulk = "D2_F2_tt" , LowBulk = "D2_F2_TT")

#Windows Power Shell Terminal on Windows

PS C:\Users\micha\OneDrive\Desktop> python .\PyBSASeq.py -i Hall.csv -o Sorghum -p F2 --smooth TRUE -c 99,5,6,1 -b 45,38 -v .01,.01 -s 5000000,10000 -m 100,3
```




