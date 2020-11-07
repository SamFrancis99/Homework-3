# Question 1
  # Part A
    # Installing all the necessary packages to analyze the data
install.packages("coronavirus")
install.packages("backports")
install.packages("devtools")
devtools::install_github("RamiKrispin/coronavirus")
    # Loading and updating the coronavirus dataset
library(coronavirus)
update_dataset()

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