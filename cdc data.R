# First of all, I need to import the cdc data
source("http://www.openintro.org/stat/data/cdc.R")

# Problem 1

# Make a scatterplot of weight versus desired weight. Describe the relationship between these two variables
# Firstly, I need to make a command to create a plot
plot(cdc$weight, cdc$wtdesire, xlab="current Weight", ylab= "desired Weight")
# Based on the plot that we have, can be interpreted that the relation between those two variables is inversely proportional
# as the variable weight increases, it corresponds to the decrease of the desired weight
# In other words, people who have higher weight tend to desire lower weight
# thus the opposite way, where people who have lower weight tend ro desire higher weight

# Problem 2

# Let's consider a new variable: the difference between desired weight (wtdesire) and current weight (weight). Create this new variable by subtracting the two columns in the data frame and assigning them to a new object called wdiff.
# I need to declare a new variable and set it as a sustraction of desired weight by the current actual weight
wdiff <- (cdc$wtdesire-cdc$weight)
# Just in case, we want to see the table of wdiff variable
View(wdiff)

# Problem 3

# What type of data is wdiff? If an observation wdiff is 0, what does this mean about the person's weight and desired weight. What if wdiff is positive or negative?
# Firstly, I will use class function to determine the type of data wdiff is
class(wdiff)
# This is just to show the table of wdiff to make it easier to be visualized
d = table(wdiff)
# After running this command, I found out that the type is integer based on my output
# If an observation wdiff is 0, then, it can be interpreted that the weight is perfect or desired weight
# Or in other words, person weight = desired weight
# Nevertheless, if the result of the substraction is poitive, then, it means overweight
# Whilst, if the result of the substraction is negative, then, it means underweight

# Problem 4

# Describe the distribution of wdiff in terms of its center, shape, and spread, including any plots you use. What does this tell us about how people feel about their current weight?
# Firstly, I am gonna use summary function to see the overview of mean, median, min, max value,etc
summary(wdiff)
# get the standard deviation of wdiff
sd(wdiff)
# get the boxplot type of it
boxplot(wdiff)
#get the plot density type of it
plot(density(wdiff))
# Based on two plots that we have, can be concluded that the peak is around 0, hence,
# it seems that most people are pretty happy with their current weight since can be seen that
# most people's current weight are pretty close to their desired weight

# Problem 5

# Using numerical summaries and a side-by-side box plot, determine if men tend to view their weight differently than women.
# Box plot comparing men and women will be created downhere
boxplot(cdc$weight-cdc$wtdesire ~ cdc$gender)
# Numerical summaries for both men and women will also be created
genwdiff <- data.frame(wdiff,cdc$gender)
summary(subset(genwdiff,cdc.gender== "m"))
# Based on the plot we have, can be deduced that there is almost no difference due to the fact
# that their actual weight compared to their desired weight are really close to zero as represneted by the plot.
summary(wdiff[cdc$gender == "m"])
summary(wdiff[cdc$gender == "f"])
# According to the summary, can be analyzed that more women tend to desire to lose weight
# there are more men tend to desire to gain more weight

# Problem 6

# Now it's time to get creative. Find the mean and standard deviation of weight and determine what proportion of the weights are within one standard deviation of the mean.
# Firstly, the mean will be calculated
mean(cdc$weight)
# Secondly, the standard deviation will be calculated
sd(cdc$weight)
# Calculate and determine the proportion  the weights are within one standard deviation of the mean
# new variables for mean and standard deviations need to be declared
Wmean = mean(cdc$weight)
Wstandarddeviation = sd(cdc$weight)
# We will use subset to select entries for which weight lies within one standard deviation of the mean only
newcdc = subset(cdc, cdc$weight>(Wmean-Wstandarddeviation) & cdc$weight<Wmean+Wstandarddeviation)
#In order to get the proportion, row of this subset needs to be divided by the row of our original dataser
nrow(newcdc)/nrow(cdc)

