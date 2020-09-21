# First of all, I will download the data source
download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData")
load("ames.RData")
# I will use view command to open the dataset
View(ames)
# These line of codes will be needed for answering three questions below
# I copy and pasted these codes from the explaination part of the problem
population <- ames$Gr.Liv.Area
samp <- sample(population, 60)
samp_mean <- rep(NA, 50)
samp_sd <- rep(NA, 50)
n <- 60
for(i in 1:50){
  samp <- sample(population, n)
  samp_mean[i] <- mean(samp)
  samp_sd[i] <- sd(samp)
}
lower <- samp_mean - 1.96 * samp_sd / sqrt(n)
upper <- samp_mean + 1.96 * samp_sd / sqrt(n)
# Problem 1
# Using the following function (which was downloaded with the data set), plot all intervals. What proportion of your confidence intervals include the true population mean? Is this proportion exactly equal to the confidence level? If not, explain why.
plot_ci(lower_vector,upper_vector,mean(population))
y <- 1-(1/50)
# According to the plot that I have, can be concluded that 49 out of 50 of the control intervals found to include the true mean
# In this case, the proportion is not exactly equal to the confidence level
# Since, it was actually not intended to get the exact value.
# Problem 2
# Pick a confidence level of your choosing, provided it is not 95%. What is the appropriate critical value?
# For this problem, I will pick 93% cofidence level
# Using the formula 1 - a/2 = 1 - 0.07/2 = 0.965
# Afterward, critical value will be calculated based on that number
Z <- qnorm(.965)
# Then, after printing the output, I found ot that my critical value for 93% confidence level was found to be 1.81191067298526

# Problem 3
# Calculate 50 confidence intervals at the confidence level you chose in the previous question. You do not need to obtain new samples, simply calculate new intervals based on the sample means and standard deviations you have already collected. Using the plot_ci function, plot all intervals and calculate the proportion of intervals that include the true population mean. How does this percentage compare to the confidence level selected for the intervals?
samp_mean <- rep(NA, 50)
samp_sd <- rep(NA, 50)
n <- 60
for(i in 1:50){
  samp <- sample(population, n)
  samp_mean[i] <- mean(samp)
  samp_sd[i] <- sd(samp)
}
lower <- samp_mean - 1.81 * samp_sd / sqrt(n)
upper <- samp_mean + 1.81 * samp_sd / sqrt(n)
c(lower[1],upper[1])
plot_ci(lower, upper, mean(population))
x <- 1-(3/50)
# Based on the plot and calculation, can be summarized that the proportion of confidence interval plot at 93% was found to be 0.94
# Compared to the plot from part 1, part 3 has proportion 0.94 whilst part 1 has proportion of 0.98
# This was mostly caused by the fact that part 1 has a higher critical value of 1.96 while
# part 3 has critical value of 1.81