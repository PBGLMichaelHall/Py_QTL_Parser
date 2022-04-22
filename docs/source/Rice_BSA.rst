==================
QTL_BSA_in_Python
==================

:Author: Michael Hall
:Date:   4/13/2022


Examples:
=========

Load/install libraries
======================

.. code:: r 
   
   devtools::install_github("PBGLMichaelHall/Py_QTL_Parser",force = TRUE)
   library(PyQTLParser)
   library(vcfR)
::

   # Set the Working Directory to where VCF file is stored in file system
   # In this case it is in a directory named RiceCold
.. code:: r 

   setwd("/home/michael/Desktop/RiceCold/")
   
Vcf file must only contain bialleleic variants. (filter upstream, e.g., with bcftools view -m2 -M2), also the QTLseqR functions will only take SNPS, ie, length of REF and ALT== 1
==================================================================================================================================================================================

.. code:: r

   file <- "wGQ-freebayes~bwa~IRGSP-1.0~both-segregant_bulks~filtered-default.vcf.gz"

   vcf <- read.vcfR(file)

   VCF_TIDY <- vcfR2tidy(vcf)
   
   Py_QTL_Parser(vcf = VCF_TIDY, HighBulk = "ET-pool-385", LowBulk = "ES-pool-430")

   
   #Run this command in Terminal calling the python script where 
   -i input file
   -o name of output directory where plots go
   -p population structure
   -b sample size from HighBulk,LowBulk
   
   python PyBSASeq.py -i Hall.csv -o RiceCold -p F2 -b 430,385
   
   #Please refer to:
   https://github.com/dblhlx/PyBSASeq/tree/master/BulksOnly
   for more help
   
   #The analysis takes over 4 hours


.. figure:: ../images/lot.png
   :alt: 
   
   
   
.. figure:: ../images/lot2.png
   :alt: 
