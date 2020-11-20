# Question 1 --------------------------------
  # Part A =================================
    # Installing all the necessary packages to analyze the data
install.packages("coronavirus")
install.packages("devtools")
install.packages("ggplot2")
devtools::install_github("RamiKrispin/coronavirus")
    # Loading the coronavirus dataset
library(coronavirus)
library(dplyr)
library(tidyr)
library(ggplot2)
library(grid)

  # Part B =================================
    # Showing the first 100 rows of the coronavirus dataset
head(coronavirus, 100)

  # Part C =================================
    # date - The date of the summary
    # province - The province or state, when applicable
    # country - The country or region name
    # lat - Latitude point
    # long - Longitude point
    # type - the type of case (i.e., confirmed, death)
    # cases - the number of daily cases (corresponding to the case type)


# Question 2 --------------------------------
  # Part A =================================
top_20 = coronavirus %>%
    # filter the data set by confirmed cases
  filter(type == "confirmed") %>%
    # group the confirmed cases by country
  group_by(country) %>%
    # create a new data frame entitled "total_cases" which is the sum of confirmed cases by country
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases) %>%
  head(20)

  # Part B =================================
    # Creating a top 5 data set
top_5 = top_20 %>% head(5)
    # Creating the top 5 bar graph
top_5_bar_graph = ggplot(data = top_5,
                         aes(x = country,
                             y = total_cases)) + 
  geom_bar(stat="identity")
    # Displaying the top 5 bar graph
top_5_bar_graph

  # Part C =================================
    # Switching to horizontal
top_5_bar_graph + coord_flip()

  # Part D =================================
    # Putting a title on the graph
top_5_bar_graph = top_5_bar_graph + ggtitle("Top 5 countries by total cases")
    # Displaying the bar graph with a title
top_5_bar_graph


# Question 3 --------------------------------
  # Part A =================================
    # Creating data frame called recent_cases
recent_cases = coronavirus %>%
    # filter by confirmed cases
  filter(type == "confirmed") %>%
    # creating a grouping variable
  group_by(date) %>%
    # creating a column in the data frame that is the sum of total cases
    # these sums of total cases are grouped the grouping variable dates created earlier
  summarise(total_cases = sum(cases))

    # reverse the order of the recent_cases data frame by date so that the most recent date is first
recent_cases = recent_cases[rev(order(as.Date(recent_cases$date, format = "%y/%m/%d"))),]

  # Part B =================================
    # Creating the line plot
recent_cases_line_plot = ggplot(data  = recent_cases, 
                                aes(x = date,
                                    y = total_cases,
                                    group=1)) +
  geom_line()
    # Displaying the line plot
recent_cases_line_plot


# Extra Credit All changes start from the default bar plot or line plot --------------------------------

  # 1. Changing Width of the Bars
ggplot(data     = top_5,
       aes(x    = country,
           y    = total_cases)) + 
  geom_bar(stat ="identity", width=0.5)

  # 2. Changing the Color of the Bars
ggplot(data      = top_5,
       aes(x     = country,
           y     = total_cases)) + 
  geom_bar(stat  ="identity", 
           color = "blue",
           fill  = "white")

  # 3. Adding Labels to the bars
ggplot(data           = top_5,
       aes(x          = country,
           y          = total_cases)) + 
  geom_bar(stat       = "identity") +
  geom_text(aes(label = total_cases), 
            vjust     = -0.3,
            size      = 3.5)

  # 4. Adding a legend to the bar graph
ggplot(data           = top_5,
       aes(x          = country,
           y          = total_cases,
           fill       = country)) + 
  geom_bar(stat       = "identity")

  # 5. Changing the legend position
ggplot(data             = top_5,
       aes(x            = country,
           y            = total_cases,
           fill         = country)) + 
  geom_bar(stat         = "identity") +
  theme(legend.position = "bottom")

  # 6. Adding Points to the lines
ggplot(data      = recent_cases, 
       aes(x     = date,
           y     = total_cases,
           group = 1)) +
  geom_line() +
  geom_point()

  # 7. Changing the line type
ggplot(data          = recent_cases, 
       aes(x         = date,
           y         = total_cases,
           group     = 1)) +
  geom_line(linetype = "dashed")

  # 8. Changing the line color
ggplot(data       = recent_cases, 
       aes(x      = date,
           y      = total_cases,
           group  = 1)) +
  geom_line(color = "green")

  # 9. Adding arrows to the line plot
ggplot(data       = recent_cases, 
       aes(x      = date,
           y      = total_cases,
           group  = 1)) +
  geom_line(arrow = arrow(
             type = "closed"
  ))
  # 10. Changing the connection type of the line plot
ggplot(data       = recent_cases, 
       aes(x      = date,
           y      = total_cases,
           group  = 1)) + 
  geom_step()
