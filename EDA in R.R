#Data Exploration in R
library(tidyverse) #call your library to be used 
data()
?starwars
dim(starwars) #dimension tells us number of rows and columns
str(starwars) #gives us the structure of the data set
glimpse(starwars) #comes with tidyverse that gives a neater list of variables
View(starwars) #brings up the dataset
head(starwars) #gives the first six rows
tail(starwars) #gives last six rows
starwars$name #to look at a particular vector


attach(starwars) #to avoid calling the data set all the time we therefore attach it

names(starwars) #to look at the name of variables in the data set
length(starwars) #tells the number of variables
class(skin_color) #tells which type of variable a class is
length(species) #tells the number of observations
unique(hair_color) #tells the unique observations in a variable

table(hair_color) #counts up observations in a data set have unique observations
sort(table(hair_color), decreasing = TRUE) # sorts by default from smallest to largest if not specified
View(sort(table(hair_color), decreasing = TRUE)) #gives the table itself
barplot(sort(table(hair_color), decreasing = TRUE)) #draws a barplot


#we could aslo use a pipe operator 
starwars %>% 
  select(hair_color) %>% 
  count(hair_color) %>% 
  arrange(desc(n)) %>% 
  View()

starwars[is.na(hair_color) , ] #selects where the first statement is true and all of the columns
View(starwars[is.na(hair_color) , ]) #gives a view of the statement

#suppose we were dealing with a numerical variable how do we explore it
class(height) 
length(height)
summary(height) #gives the whole summary of the variable height
boxplot(height) #gives a representative boxplot of the data
hist(height) #gives representative bin of the variable
