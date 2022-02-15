#Downloading Borrelia burgdorferi data from GenBank

#create vector of sequence IDs to be retrieved
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")

#load rentrez library
library(rentrez) 

#fetch sequence data from GenBank using ids listed above
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
Bburg

#split Bburg into 3 elements, one for each sequence
sequences <- strsplit(Bburg, split = "\n\n")

#unlist sequences
sequences <- unlist(sequences)

#separate headers and sequences, create dataframe
header <- gsub("(>.*sequence)\\n[ATCG].*", "\\1", sequences)
seq <- gsub(">.*sequence\\n([ATCG].*)", "\\1", sequences)
sequences <- data.frame(Name = header, Sequence = seq)

#remove newlines from sequences
sequences$Sequence <- gsub("\\n", "", sequences$Sequence)

#output to sequences.csv
write.csv(sequences, file = "A5_Tang_Caroline_Sequences.csv", row.names = F)
