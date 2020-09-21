# Firstly, the source of the data will be downloaded down here
download.file("http://www.openintro.org/stat/data/mlb11.RData", destfile = "mlb11.RData")
load("mlb11.RData")
# View command will be declared below to enable me to visualizethe data easier
View(mlb11)
cor(mlb11$runs, mlb11$at_bats)
# Problem 1
# Choose another traditional variable from mlb11 that you think might be a good predictor of runs. Produce a scatterplot of the two variables and fit a linear model. At a glance, does there seem to be a linear relationship?
# new variable will be created down here
mX <- lm(runs ~ bat_avg, data = mlb11)
summary(mX)
# I will create a plot to make the data more visualizable 
plot(mlb11$bat_avg,mlb11$runs)
abline(mX, col = "blue")
# Hence, according to all information that I have, can be deduced that there is a linear 
# relationship between variable runs and variable bat_average
# Problem 2
# How does this relationship compare to the relationship between runs and at_bats? Use the R2 values from the two model summaries to compare. Does your variable seem to predict runs better than at_bats? How can you tell?
m1 <- lm(runs ~ at_bats, data = mlb11)
# summary command will be used to get the overview of the data for variable m1
summary(m1)
# summary command will be used to get the overviewof the data for variable mX
summary(mX)
# Those two summaries will be used for comparison
# Based on the summary that I have in my output, can be seen that the R-squared for 
# variable mX was found to be higher  which corresponds to a stronger relationship compared to variable m1 which can be translated that
# relationship between run and bat_average is obviously stronger than relationship between
# at_bats and runs due to the fact that the R square for mX was 0.6561 which is higher compared
# to R square for m1 which is 0.3729.
# Problem 3
# Now that you can summarize the linear relationship between two variables, investigate the relationships between runs and each of the other five traditional variables. Which variable best predicts runs? Support your conclusion using the graphical and numerical methods we've discussed (for the sake of conciseness, only include output for the best variable, not all five).
# Histogram command will be used downhere
hist(mX$residuals)
# Plot might also be needed to answer this question in my opinion
plot(mX$residuals)
abline(h = 0)
# I need normal qq plot, to get the see how the data behaves
qqnorm(mX$residuals)
# After comparing it with all traditional variables, based on the output, plot, and
# histogram that I have, can be concluded that bat_avg which is the average variable was found to be
# the one that predicts variable runs the best. It was found to be the one that correlates the most
# with the highest correlation value among other variables. 
# Problem 4
# Now examine the three newer variables. These are the statistics used by the author of Moneyball to predict a teams success. In general, are they more or less effective at predicting runs that the old variables? Explain using appropriate graphical and numerical evidence. Of all ten variables we've analyzed, which seems to be the best predictor of runs? Using the limited (or not so limited) information you know about these baseball statistics, does your result make sense?
# Three new variables that will be observed are new_onbase, new_slug and new_obs
# Downhere, each new variable will be examied to get the strength of the relationship with the correlation coefficient
cor(mlb11$runs, mlb11$new_onbase)
cor(mlb11$runs, mlb11$new_slug)
cor(mlb11$runs, mlb11$new_obs)
# In addition, I think summary command for each new variable will be useful to get to know the data more
summary(lm(runs ~ new_onbase, data = mlb11))
summary(lm(runs ~ new_slug, data = mlb11))
summary(lm(runs ~ new_obs, data = mlb11))
# Plot will also be added to further the analysis
plot(mlb11$runs ~ mlb11$bat_avg)
abline(mX)
# Based on all information including output and plot that I have, can be summerized that among those three new variables,
# the relationship between runs and new_obs variable was found to be the one that has the highest R^2 and coefficient correlation values
# which corresponds to the most efficient and accurate predictor of variable runs
# Problem 5
# Check the model diagnostics for the regression model with the variable you decided was the best predictor for runs.
# new variable will be declared below for answering this question
# I chose to usevariable new_obs because of the fact that it was found out to be the best predictor based on problem 4
mCheck <- lm(runs ~ new_obs, data = mlb11)
# summary command will be used to analyze variable mCheck down here
summary(mCheck)
# I will check it using three different approacheswhich are linearity, normal residual, and constant variability
# For the linearity check, I will be using plot command
plot(mCheck$residuals ~ mlb11$new_obs)
# Can be seen that the plot shows the relation looks pretty linear
# For the normal residues check, histogram command will be used
hist(mCheck$residuals)
# Can be seen that the histogram, the residuals are normally distributed
# For the constant variability, normal qq plot will be created
qqnorm(mCheck$residuals)
# Can be seen that the normal Q-Q plot shows the variability of points around the least squares line
# tend to stay the same or constant which basically means that the constant variability was met
# According to all information above, can be concluded that it is a pretty good and accurate model.
