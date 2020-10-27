library(stringr)
library(doParallel)
cl <- makeCluster(detectCores())
registerDoParallel(cl)


# Dataimport.R must be run first


# Question 1
dim(edx)


# Question 2
table(edx$rating)


# Question 3
length(unique(edx$movieId))


# Question 4
length(unique(edx$userId))


# Question 5
edx %>% 
  separate_rows(genres, sep = "\\|") %>%
  group_by(genres) %>%
  summarize(n = n())


# Question 6

titles_of_interest <- c("Boomerang", "Forrest Gump", "Jurassic Park", "Pulp Fiction", "Shawshank Redemption", "Speed 2: Cruise Control")
titles_of_interest <- c("Outbreak", "Stargate")
titles <- edx %>%
  .$title
  
titles_of_interest_index <- unlist(lapply(titles, function(x){any(str_detect(x, titles_of_interest))}))
  mutate(str_det = TRUE %in% str_detect(.$title, "Boomerang"))

edx[titles_of_interest_index] %>%
  group_by(title) %>%
  summarize(n = n())
  

# Question 7
sort(table(edx$rating), decreasing = T)















stopCluster(cl)
