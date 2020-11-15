# Question 1
  # Part A
    # Installing all the necessary packages to analyze the data
install.packages("coronavirus")
install.packages("backports")
install.packages("devtools")
devtools::install_github("RamiKrispin/coronavirus")
    # Loading and updating the coronavirus dataset
library(coronavirus)

  # Part B
    # Showing the first 100 rows of the coronavirus dataset
head(coronavirus, 100)

  # Part C
    # date - The date of the summary
    # province - The province or state, when applicable
    # country - The country or region name
    # lat - Latitude point
    # long - Longitude point
    # type - the type of case (i.e., confirmed, death)
    # cases - the number of daily cases (corresponding to the case type)


# Question 2
  # Part A
library(dplyr)
top_20 = coronavirus %>%
    # filter the data set by confirmed cases
  filter(type == "confirmed") %>%
    # group the confirmed cases by country
  group_by(country) %>%
    # create a new data frame entitled "total_cases" which is the sum of confirmed cases by country
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases) %>%
  head(20)

bottom_20 = coronavirus %>%
  # filter the data set by confirmed cases
  filter(type == "confirmed") %>%
  # group the confirmed cases by country
  group_by(country) %>%
  # create a new data frame entitled "total_cases" which is the sum of confirmed cases by country
  summarise(total_cases = sum(cases)) %>%
  arrange(total_cases) %>%
  head(20)

  # Part B
    # Convert the total_cases to a vector format
top_5_cases_vector = as.vector(top_20$total_cases) %>% head(5)
    # convert the countries to a vector format
top_5_countries_vector = as.vector(top_20$country) %>% head(5)
    # Create a barplot of the total_cases in the top_5_cases_vector and assign
    # the country names the each bar)
barplot(top_5_cases_vector, 
        names.arg = top_5_countries_vector)

  # Part C
barplot(top_5_cases_vector, 
        names.arg = top_5_countries_vector, 
    # Converting the bar plot to a horizontal format
         horiz     = TRUE)

  # Part D
barplot(top_5_cases_vector, 
        names.arg = top_5_countries_vector, 
        horiz     = TRUE,
    # Changing the title of the bar plot
        main      = "Top 5 countries by total cases")
