```{r}

## READ IN THE DATA
day2input <- read_delim('https://raw.githubusercontent.com/bmtalbot/Advent_of_code/main/2022/Day_02/input.txt', delim = "\n", skip_empty_rows = FALSE, col_names = FALSE )

day2input <- day2input %>% separate(X1, into = c('opponent','player'))

## Caluculate the value of each round: 
#A and X = Rock (1 pt)
#B and Y = Paper (2 pt)
#C and Z = scissors (3 pt)
# losing is 0 points, draw is 3, six if you win


day2input <- day2input %>% mutate(shapescore = case_when(player %in% 'X' ~ 1, player %in% 'Y' ~ 2, player %in% 'Z' ~ 3))

day2input <- day2input %>% mutate(playscore = case_when(player %in% 'X' & opponent %in% 'A' | player %in% 'Y' & opponent %in% 'B' | player %in% 'Z' & opponent %in% 'C' ~ 3, 
                                                        player %in% 'X' & opponent %in% 'C' | player %in% 'Y' & opponent %in% 'A' | player %in% 'Z' & opponent %in% 'B' ~ 6,
                                                        player %in% 'X' & opponent %in% 'B' | player %in% 'Y' & opponent %in% 'C' | player %in% 'Z' & opponent %in% 'A' ~ 0))

## SUMMING VALUES

sum(day2input$shapescore) + sum(day2input$playscore)
```
