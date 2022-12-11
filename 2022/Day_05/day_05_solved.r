day5input <- read_delim("https://raw.githubusercontent.com/bmtalbot/Advent_of_code/main/2022/Day_05/input_5.txt", delim = "\n", col_names = FALSE)

## creating a vector of the file to iterate over
day5string_split <- unlist(str_split(day5input,boundary("character")))

## TEST STRING
str <- c("t","z","l","t","z","l","t","t","h","f","t","h","t","d","a","s","t","f","t","b","f","a")

## PRINTS ALL OF THE 4 LETTER STRINGS AND A LOGICAL VALUE IF IT WAS DUPLICATED IN THAT STRING 
## ULTIMATELY, FIND THE FIRST GROUP OF FOUR WITH NO 'TRUE' IN THE STRING
my_frame <- NULL
count = 0
for (i in day5string_split) {
  {
  
    # incrementing count
    count= count + 1
      
          
        # printing the specific element
        my_out <- print(paste(day5string_split[c(count,count+1,count+2,count+3)],"",duplicated(day5string_split[c(count,count+1,count+2,count+3)])))
        
        my_frame <- rbind(my_frame, my_out)
        ##Somehow need to save this output to a vector? Then I can find the index (maybe using grep and and a loop) where the string starts and multiply by 4 to get the first position in the original string
      
}
}

## BUILD OFF OF THE DATA FRAME TO FIND THE FIRST ROW WHERE THERE IS NO TRUE
my_frame <- as.data.frame(my_frame)
my_frame <- my_frame %>% mutate(thing = case_when(grepl("TRUE",my_frame$V1) | grepl("TRUE",my_frame$V2) | grepl("TRUE",my_frame$V3) | grepl("TRUE",my_frame$V4) ~ "Duplicate", TRUE ~ "UNIQUE" ))

## ACTUALLY EACH ROW OF THE DF IS THE POSITION OF THE FIRST CHARACTER, SO JUST FILTER TO THE FIRST "UNIQUE" ROW AND ADD 4
