#' @title Py_QTL_Parser
#' @description Parses a vcf file which has been converted to a tidy data frame before running the operation
#' @param vcf A vcf file that is as a tidy data frame
#' @param HighBulk The name of the HighBulk sample
#' @param LowBulk The name of the LowBulk sample
#' @export


Py_QTL_Parser <- function(vcf,HighBulk,LowBulk){
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
  write.table(Data, file = paste0(HighBulk, ".tsv"), row.names = FALSE,
              col.names = TRUE, sep = "\t", quote = TRUE)
  write.table(Data, file = paste0(HighBulk, ".csv"), row.names = FALSE,
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
  write.table(Data, file = paste0(LowBulk, ".tsv"), row.names = FALSE,
              col.names = TRUE, sep = "\t",quote = TRUE)
  write.table(Data, file = paste0(LowBulk, ".csv"), row.names = FALSE,
              col.names = TRUE, sep = ",",quote = TRUE)
  str(Data)
  df1 <- read.csv(file = paste0(HighBulk, ".csv"), header = TRUE)
  df2 <- read.csv(file = paste0(LowBulk, ".csv"), header = TRUE)
  df3 <- merge(df1, df2, by = c("CHROM", "POS", "REF", "ALT","QUAL"),
               all.x = FALSE, all.y = FALSE)
  df3 <- na.omit(df3)
  write.table(df3, file = "Hall.csv", row.names = FALSE, col.names = TRUE,
              sep = ",")
}

