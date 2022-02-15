#covid19 genetics

#load rentrez package
library(rentrez)

#obtain covid genome sequence using ID NC_045512.2
covidGenome <- entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")

#separate header from sequence, remove newlines
header <- gsub("(>.*genome).*", "\\1", covidGenome)
seq <- gsub(">.*genome\\n([ATCG].*)", "\\1", covidGenome)
seq <- gsub("\\n", "", seq)

#isolate S protein from genome - start: ATGTTTGTTTTTCTTGTTTTA, end: GTCAAATTACATTACACATAA
protein <- gsub(".*(ATGTTTGTTTTTCTTGTTTTA.*GTCAAATTACATTACACATAA).*", "\\1", seq)

#BLAST search results
#The sequence appears to be highly conserved, as the BLAST returned 100 sequences 
#from different samples of the virus and it was a 100% match for all of them.
