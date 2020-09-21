# Problem 1

# What years are included in this data set? What are the dimensions of the data frame and what are the variable or column names?
source("http://www.openintro.org/stat/data/present.R")
# To answer that question above, we need to have three different part of codes
# Years included in this dataset
# Downhere is the code
present$year
# According to the output, the years included are known from 1940 to 2002
# Dimensions of dataframe
# Downhere is the code
dim(present)
# Based on the output that I got,the dimension is 63 rows and 3 columns
# Column names or variable of present dataframe
# Downhere is the code
names(present)
# Based on the oputput, those are year, boys, and girls

# Problem 2

# How do these counts compare to Arbuthnot's? Are they on a similar scale?
# I will get a source for this dataset
source("http://www.openintro.org/stat/data/arbuthnot.R")
# To answer that question, I will do the exact same thing and compare it with the present dataset
# This is for years included in arbuthnot dataset
# Downhere is the code
arbuthnot$year
# According to the output, the years included are known from 1629 to 1710
# Compared to the present dataset, can be said that the year range of present is different from arbuthnot datset.
# This is for dimension of arbuthnot dataset
# Downhere is the code
dim(arbuthnot)
# Based on the output, it seems that the dimension is 82 rows and 3 columns
# Coompared to the present dataset, can be said that the size is different.
# Despite the fact that both of datasets have the same amount of column (3)
# Nevertheless, present has 63 rows whilst arbuthnot has 82 rows
# Hence, can be concluded that both datasets have different size.
# This is for column names or variables for arbuthnot dataset
# Downhere is the code
names(arbuthnot)
# Based on the output receieved, those three variables are year, boys, and girls
# Compared to present dataset, can be deduced that both of them have the same variables.
# In conclusion, even though both datasets have the same variables.
# Nonetheless, they have different dimension(size) and different range of year.
# Hence, can be deduced that they are basically on different scale.

# Problem 3
source("http://www.openintro.org/stat/data/present.R")
# Make a plot that displays the boy-to-girl ratio for every year in the data set. What do you see?
# Does Arbuthnot's observation about boys being born in greater proportion than girls hold up in the U.S.? Include the plot in your response
# Calculation for the ratio of boys to girls in the present dataset
# Downhere is the code
Ratio <- present$boys/present$girls
# Then, I am gonna plot it with respect to the year
# In this plot, I chose to use pch = 16 which is represented by full circle
# Downhere is the code
plot(present$year,Ratio,pch=16,xlab="year",ylab="Ratio of boys to girls")
# Plot interpretation:
# Based on the plot, can be interpreted and analyzed that the boys to girls ratio
# has decreased since 1980. Hence, Arbuthnot's statement which 
# stated that boys born with larger proportion than girls does not hold up in the US
# Because of the fact that his statement is contradictorty with the data repesented by the plot

# Problem 4

# In what year did we see the most total number of births in the U.S.? 
# First of all, I need to sum up total births of boys and girls foreach year.
# Downhere is the code
present$totalbirth <- present$boys + present$girls
present[present$totalbirth == max(present$totalbirth), ]$year
# From the command above, the answer should be 1961
# Afterward, I need to plot the total number of births for each year
# In this case, I decided to use pch = 16 which is represented by full circle
# Downhere is the code
plot(present$year,totalbirth,pch=16,xlab = "year",ylab = "total number of births")
# According to the plot that I have, the highest total number of births recorded is found to be in 1961

