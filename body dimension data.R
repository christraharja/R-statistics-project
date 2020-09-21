# Firstly, I need to download the source of the data 
download.file("http://www.openintro.org/stat/data/bdims.RData", destfile = "bdims.RData")
load("bdims.RData")
head(bdims)
mdims<-subset(bdims,bdims$sex == 1)
fdims<-subset(bdims,bdims$sex == 0)
# Problem 1
# For each problem below, qq norm function will be used to help me visualize how the plot would be look like
# Now let's consider some of the other variables in the body dimensions data set. Using the figures at the end of the exercises, match the histogram to its normal probability plot. All of the variables have been standardized (first subtract the mean, then divide by the standard deviation), so the units won't be of any help. If you are uncertain based on these figures, generate the plots in R to check
# a) The histogram for female biiliac (pelvic) diameter (bii.di) belongs to normal probability plot letter
qqnorm(fdims$bii.di)
# The answer would be B, since can be seen that the sample quantities in plot B go as low as 4
# which I found to be consistent and related to the histogram for female biiliac (pelvic) diameter (bii.di)
# b) The histogram for female elbow diameter (elb.di) belongs to normal probability plot letter
qqnorm(fdims$elb.di)
# The answer would be C, due to the fact that the histogram is the most normal compared to other histograms
# which I believe should correspond to the QQ-plot which is the closest to a diagonal line
# c) The histogram for general age (age) belongs to normal probability plot letter
qqnorm(bdims$age)
# The answer would be D, because of the outlying values which were found to be less that 4
# I found to be that plot D is the closest with the histogram of general age which also 4 as its maximum value in x-axis
# d) The histogram for female chest depth (che.de) belongs to normal probability plot letter
qqnorm(fdims$che.de)
# The answer would be A, where it can be seen that the outlying value is greater than 4 or perhaps potentially close to 5
# which I also found that the histogram of female chest depth has a max value in x-axis which reach 5 which is obviously greater than 4.

# Problem 2
# Note that normal probability plots C and D have a slight stepwise pattern Why do you think this is the case?
# Stepwise pattern can be more obtrusive since it was produced by discrete variable, for instance age and chest depth
# whilst pelvic and elbow diameter are continuous variable.Therefore, can be deduced that this is most likely to due 
# to discrete scale on which the data was basically measured, for example, age will be more likely to be recorded as integers while diamerter will be
# more likely to be recorded as decimal (not integer), hence, this potentially creates step patter.

# Problem 3
# As you can see, normal probability plots can be used both to assess normality and visualize skewness. Make a normal probability plot for female knee diameter (kne.di). Based on this normal probability plot, is this variable left skewed, symmetric, or right skewed? Use a histogram to confirm your findings.
# Normal Q-Q plot will becreated to visualize the distribution of the data
qqnorm(fdims$kne.di)
# Just in case, if the qq line plot is also needed to help me visualize the data
qqline(fdims$kne.di)
# Histogram will also be created to analyze the data
hist(fdims$kne.di)
# According to the plot and histogram that I have, can be seen and concluded that basically
# the female knee diameter seems to skew to the right

