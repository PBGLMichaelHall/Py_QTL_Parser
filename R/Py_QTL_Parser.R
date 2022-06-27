#' @title Py_QTL_Parser_Bulks
#' @description Parses a vcf file which has been read by vcfR::read.vcfR and converted to a tidy data frame by vcfR::vcfR2tidy
#' @param vcf A vcf file that is as a tidy data frame
#' @param HighBulk The name of the HighBulk sample
#' @param LowBulk The name of the LowBulk sample
#' @param filename Provide prefix to comma separated file input name
#' @export


Py_QTL_Parser_Bulks <- function(vcf,HighBulk,LowBulk,filename){
  CHROM <- vcf$fix$ChromKey
  POS <- vcf$fix$POS
  REF <- vcf$fix$REF
  ALT <- vcf$fix$ALT
  QUAL <- round(vcf$fix$QUAL,2)
  Samples <- vcf$gt$Indiv
  F1.GT <- vcf$gt$gt_GT_alleles
  F1.AD <- vcf$gt$gt_AD
  F1.GQ <- vcf$gt$gt_GQ
  Data <- data.frame(CHROM, POS, REF, ALT, QUAL, F1.GT, F1.AD, F1.GQ,Samples)
  str(Data)
  Data <- Data[!rowSums(nchar(as.matrix(Data[3])) != 1), ]
  Data <- Data[!rowSums(nchar(as.matrix(Data[4])) != 1), ]
  Data <- Data <- Data[(as.matrix(Data[9]) == HighBulk), ]
  Data <- Data[, -9]
  str(Data)
  write.table(Data, file = "HighBulk.tsv", row.names = FALSE,
              col.names = TRUE, sep = "\t", quote = TRUE)
  write.table(Data, file = "HighBulk.csv", row.names = FALSE,
              col.names = TRUE, sep = ",", quote = TRUE)

  CHROM <- vcf$fix$ChromKey
  POS <- vcf$fix$POS
  REF <- vcf$fix$REF
  ALT <- vcf$fix$ALT
  QUAL <- round(vcf$fix$QUAL,2)
  Samples <- vcf$gt$Indiv
  S1.GT <- vcf$gt$gt_GT_alleles
  S1.AD <- vcf$gt$gt_AD
  S1.GQ <- vcf$gt$gt_GQ
  Data <- data.frame(CHROM, POS, REF, ALT, QUAL, S1.GT, S1.AD, S1.GQ,Samples)
  str(Data)
  Data <- Data[!rowSums(nchar(as.matrix(Data[3])) != 1), ]
  Data <- Data[!rowSums(nchar(as.matrix(Data[4])) != 1), ]
  Data <- Data <- Data[(as.matrix(Data[9]) == LowBulk), ]
  Data <- Data[, -9]
  write.table(Data, file = "LowBulk.tsv", row.names = FALSE,
              col.names = TRUE, sep = "\t",quote = TRUE)
  write.table(Data, file = "LowBulk.csv", row.names = FALSE,
              col.names = TRUE, sep = ",",quote = TRUE)
  str(Data)
  df1 <- read.csv(file = "HighBulk.csv", header = TRUE)
  df2 <- read.csv(file = "LowBulk.csv", header = TRUE)
  df3 <- merge(df1, df2, by = c("CHROM", "POS", "REF", "ALT","QUAL"),
               all.x = FALSE, all.y = FALSE)
  df3 <- na.omit(df3)
  write.table(df3, file = paste0(filename,".csv"), row.names = FALSE, col.names = TRUE,
              sep = ",")
}

#' @title Py_QTL_Parser_Parents
#' @description Parses a vcf file which has been read by vcfR::read.vcfR and converted to a tidy data frame by vcfR::vcfR2tidy
#' @param vcf A vcf file that is as a tidy data frame
#' @param Parent1 The name of Parent1 sample
#' @param Parent2 The name of Parent2 Sample
#' @param filename Provide prefix to comma separted file input name
#' @export


Py_QTL_Parser_Parents <- function(vcf,Parent1,Parent2,filename){
  CHROM <- vcf$fix$ChromKey
  POS <- vcf$fix$POS
  REF <- vcf$fix$REF
  ALT <- vcf$fix$ALT
  QUAL <- round(vcf$fix$QUAL,2)
  Samples <- vcf$gt$Indiv
  P1.GT <- vcf$gt$gt_GT_alleles
  P1.AD <- vcf$gt$gt_AD
  P1.GQ <- vcf$gt$gt_GQ
  Data <- data.frame(CHROM, POS, REF, ALT, QUAL, P1.GT, P1.AD, P1.GQ,Samples)
  str(Data)
  Data <- Data[!rowSums(nchar(as.matrix(Data[3])) != 1), ]
  Data <- Data[!rowSums(nchar(as.matrix(Data[4])) != 1), ]
  Data <- Data <- Data[(as.matrix(Data[9]) == Parent1), ]
  Data <- Data[, -9]
  str(Data)
  write.table(Data, file = "Parent1.tsv", row.names = FALSE,col.names = TRUE, sep = "\t", quote = TRUE)
  write.table(Data, file = "Parent1.csv", row.names = FALSE,col.names = TRUE, sep = ",", quote = TRUE)
  
  CHROM <- vcf$fix$ChromKey
  POS <- vcf$fix$POS
  REF <- vcf$fix$REF
  ALT <- vcf$fix$ALT
  QUAL <- round(vcf$fix$QUAL,2)
  Samples <- vcf$gt$Indiv
  P2.GT <- vcf$gt$gt_GT_alleles
  P2.AD <- vcf$gt$gt_AD
  P2.GQ <- vcf$gt$gt_GQ
  Data <- data.frame(CHROM, POS, REF, ALT, QUAL, P2.GT, P2.AD, P2.GQ,Samples)
  str(Data)
  Data <- Data[!rowSums(nchar(as.matrix(Data[3])) != 1), ]
  Data <- Data[!rowSums(nchar(as.matrix(Data[4])) != 1), ]
  Data <- Data <- Data[(as.matrix(Data[9]) == Parent2), ]
  Data <- Data[, -9]
  write.table(Data, file = "Parent2.tsv", row.names = FALSE,
              col.names = TRUE, sep = "\t",quote = TRUE)
  write.table(Data, file = "Parent2.csv", row.names = FALSE,
              col.names = TRUE, sep = ",",quote = TRUE)
  str(Data)
  dP1 <- read.csv(file = "Parent1.csv", header = TRUE)
  df2 <- read.csv(file = "Parent2.csv", header = TRUE)
  df3 <- merge(dP1, df2, by = c("CHROM", "POS", "REF", "ALT","QUAL"),all.x = FALSE, all.y = FALSE)
  df3 <- na.omit(df3)
  write.table(df3, file = paste0(filename,".csv"), row.names = FALSE, col.names = TRUE,sep = ",")
}
