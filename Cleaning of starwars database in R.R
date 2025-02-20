library(tidyverse) #call your library to be used 
View(starwars)

# to know the variable types
glimpse(starwars)
class(starwars$gender)
unique(starwars$gender)

attach(starwars) #to avaoid calling the data frame every time
gender <- as.factor(gender) #converts the gender to a factor
class(gender)
levels(gender) #gives the levels 
gender <- factor((gender),
                 levels = c("masculine",
                            "feminine"))
levels(gender) # the levels has been changed using factor function

# selecting and filtering data 
names(starwars)
starwars %>% 
  select(name, height, ends_with("color")) #gives the data frame of the selected items 

# filtering observations
unique(hair_color)

starwars %>% 
  select(name, height, ends_with("color")) %>% 
  filter(hair_color %in% c("blond", "brown") &
          height< 180)

# Missing data removal 
mean(height, na.rm = TRUE ) # this removes the missing data from mean as R cannot calculate mean with missing value

starwars %>% 
  select(name, gender, hair_color, height)

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  na.omit() #removes missing values 

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.))

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  drop_na(height)

starwars %>% 
  select(name,gender,hair_color, height) %>% 
  drop_na(height) %>% 
  View()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  mutate(hair_color = replace_na(hair_color, "none")) # mutate either creates a new variable or changes existing

#Duplicates
#there are no duplicates in starwars but here is an illustration 
Names<- c("James", "John","Paul","Adrian","James")
Age<- c(22, 33, 44, 22,22)
friends <- data.frame(Names,Age)
friends

#identify the duplicates\

friends[!duplicated(friends), ]

friends %>% distinct()#another way to do it 


#Recoding variables 
starwars %>% 
  select(name, gender)

starwars %>% 
  select(name, gender) %>% 
  mutate(gender_coded = recode(gender,
                         "masculine" = 1,
                         "feminine"= 2))#we have created a new column to store the new coded info
