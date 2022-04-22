==================
QTL_BSA_in_Python
==================

:Author: Michael Hall
:Date:   4/13/2022


Citations
=========

Citation: If you used PyBSASeq in your pulications, please cite:

    Zhang, J., Panthee, D.R. PyBSASeq: a simple and effective algorithm for bulked segregant analysis with whole-genome sequencing data. BMC Bioinformatics 21, 99 (2020). https://doi.org/10.1186/s12859-020-3435-8
    Zhang, J., Panthee, D.R. Next-generation sequencing-based bulked segregant analysis without sequencing the parental genomes. G3 Genes|Genomes|Genetics, jkab400 (2021), https://doi.org/10.1093/g3journal/jkab400


Prerequisite Software Tools:
============================

.. code:: r

   # For more efficient comupting of the algorithm please download Fisher's Exact Test.

   Installation

   Within this folder :

   git clone git://github.com/brentp/fishers_exact_test.git
   pip install .

   From PyPI :

   pip install fisher

   Or install the development version :

   pip install git+git://github.com/brentp/fishers_exact_test.git




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
   
   
   
Pre-Filtering Rules
=================================================


.. code:: r

   Vcf file must only contain bialleleic variants. (filter upstream, e.g., with bcftools view -m2 -M2).
   
.. code:: r

   Also, the QTL analysis will only take SNPS, ie, length of REF and ALT== 1. However this is addressed in Py_QTL_Parser function.

=========================================================================================================================================================



VCF Format Fields and Bulk Segregant Sample Names
=================================================

.. code:: r

   I want to view the first line CHROM and relevant Format Fields because I know in order for this to work there must be a GQ (Genotype Quality) variable in the Format Field. 
      
.. figure:: ../images/gt.png
   :alt: 
   
R Script
========
   
.. code:: r
   
   file <- "wGQ-freebayes~bwa~IRGSP-1.0~both-segregant_bulks~filtered-default.vcf.gz"

   vcf <- read.vcfR(file)

   VCF_TIDY <- vcfR2tidy(vcf)
   
   Py_QTL_Parser(vcf = VCF_TIDY, HighBulk = "ET-pool-385", LowBulk = "ES-pool-430")
   
   # The file is named Hall.csv and should be in the working directory.
   # I want to inspect the imported header.
   
Header of Input CSV file with overall Quality Socres, Genotype Quality and Allelic Depths for both High and Low Bulks
======================================================================================================================
.. figure:: ../images/ga.png
   :alt: 


Python Script
=============

.. code:: r

   Run this command in Terminal calling the python script where 
   -i input file
   -o name of output directory where plots go
   -p population structure
   -b sample size from HighBulk,LowBulk
   
   python PyBSASeq.py -i Hall.csv -o RiceCold -p F2 -b 430,385

   Please refer to:
   https://github.com/dblhlx/PyBSASeq/tree/master/BulksOnly
   for more help
   
   # The analysis takes over 4 hours

Standard RStudio Console Output
===============================

.. figure:: ../images/lot.png
   :alt: 
   
Analysis Plots: Number of SNPs called in window, SNP ratio, G Statistic and Delta AF or change in Allelic Frequencies
=====================================================================================================================
   
.. figure:: ../images/lot2.png
   :alt: 
