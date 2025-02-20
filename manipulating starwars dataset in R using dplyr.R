library(tidyverse)
View(starwars)
starwars %>% 
  select(name, species, contains("color")) %>% # helpsusdecide what rows we want 
  head(10) #selects first 10 rows of the columns selected 

#filtering data
starwars %>% 
  select(name, height, species, eye_color) %>% 
  filter(species == "Human" & 
           height < 200 &
           eye_color %in% c("blue", "brown")) %>% 
  head(10)

# mutate the data 
starwars %>% 
  select(name, height, mass, species) %>% 
  mutate(height = height/100) %>% 
  head(10)

#Arranging a dataset 
starwars %>% 
  select(name,height,mass,species) %>% 
  arrange(height) %>% 
  head(10)

#recode the data
starwars %>% 
  select(name, contains("color"), species) %>% 
  mutate(species = recode(species,
                          "Droid" = "Robot")) %>% 
  head(10)

# summarize the data 
starwars %>% 
  select(sex, height, mass) %>% 
  filter(sex == "male"|
           sex == "female") %>% 
  mutate(height = height/100) %>% 
  drop_na() %>% 
  group_by(sex) %>% 
  summarize('Average height' = (mean(height)),
            'Average mass' = mean(mass)) #this gives average height and mass and shows which gender is more taller  






