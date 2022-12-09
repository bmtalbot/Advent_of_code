# Lowercase item types a through z have priorities 1 through 26.
# Uppercase item types A through Z have priorities 27 through 52.
# In the above example, the priority of the item type that appears in both compartments of each rucksack is 16 (p), 38 (L), 42 (P), 22 (v), 20 (t), and 19 (s); the sum of these is 157.
# 
# Find the item type that appears in both compartments of each rucksack. What is the sum of the priorities of those item types?

day3input <- read_delim('https://raw.githubusercontent.com/bmtalbot/Advent_of_code/main/2022/Day_03/input-03.txt', delim = "\n", skip_empty_rows = FALSE, col_names = FALSE )

## SEPARATING THE COMPARTMENTS FOR LATER COMPARISON 

day3input <- day3input %>% mutate(x2 = floor(nchar(X1)/2)) ##FIND EACH ROW'S HALFWAY POINT
day3input <- day3input %>% rowwise() %>% mutate(x3 = sub(paste0("^(.{", x2, "})(.*)$"), paste0("\\1,\\2"), X1))
day3input <- day3input %>% separate(x3, into = c('comp1', 'comp2'), sep = ',')

## FIND THE COMMON LETTER BETWEEN TWO VECTORS
library(qualV)

d3_common_char <- as.data.frame(as.matrix(sapply(seq_along(day3input$comp1), function(i)
    paste(LCS(strsplit(day3input$comp1[i], '')[[1]], strsplit(day3input$comp2[i], '')[[1]])$LCS,
          collapse = ""))))
d3_common_char$V1 <- substr(d3_common_char$V1,1,1)

## MAP THE LETTERS TO NUMBERS  
upletters <- LETTERS[1:26]
lowletters <- letters[1:26]
allletters <- c(lowletters,upletters)
d3_common_char$points <- match(d3_common_char$V1, allletters)

## GET THE SUM OF PRIORITY POINTS
sum(d3_common_char$points)
