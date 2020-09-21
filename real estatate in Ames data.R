# First of all, the data source needs to be downloaded
download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData")
load("ames.RData")
# I will use View to get the data table
View(ames)
# Downhere are codes from lab 5a which might be needed to answer these questions
area <- ames$Gr.Liv.Area
price <- ames$SalePrice
# Problem 1
# Take a random sample of size 50 from price. Using this sample, what is your best point estimate of the population mean?
# Downhere, the mean command will be used to providethe further analysis of the data
mean(price)
sampleone <- sample(price, 50)
mean(sampleone)
# Based on comparing those two mean values, therefore, my best point estimation of the population mean is 
# 177092.9 compared to the population mean which was found to be 180796.1.
# I found that the random sample slightly lower compared to actual population mean

# Problem 2
# Since you have access to the population, simulate the sampling distribution for x¯price by taking 5000 samples from the population of size 50 and computing 5000 sample means. Store these means in a vector called sample_means50. Plot the data, then describe the shape of this sampling distribution. Based on this sampling distribution, what would you guess the mean home price of the population to be? Finally, calculate and report the population mean.
# For loop will be used in this case as well as sample_means50 will be declared
sample_means50 <- rep(0,5000)
for(i in 1:5000){
  samplex <- sample(price, 50)
  sample_means50[i] <- mean(samplex)
}
View(sample_means50)
# Downhere the histogram will be created to provide better outlook of the data
hist(sample_means50)
# Therefore, based on the dataset of sample_means50 and histogram that I have, can be 
# guessed that the mean home price of the population is at around $180000, this claim is also 
# supported by the fact that based on the histogram, the highest peak reached was found at around $180000
# or in other words, the center of normal distribution was found to be at $ 180000
# Then to calclulate and report the mean of the population, the mean command will be used
mean(price)
summary(price)
# Hence, based on the output that I obtained, the mean was calculated and reported to be 180796.1
# which actually found to be pretty consistent with the histogram

# Problem 3
# Change your sample size from 50 to 150, then compute the sampling distribution using the same method as above, and store these means in a new vector called sample_means150. Describe the shape of this sampling distribution, and compare it to the sampling distribution for a sample size of 50. Based on this sampling distribution, what would you guess to be the mean sale price of homes in Ames?
# For loop will be created and sample_means150 variable will also be declared
sample_means150 <- rep(0, 5000)
for (i in 1:5000){
  sampley <- sample(price, 150)
  sample_means150[i] <- mean(sampley)
}
# Downhere the histogram will be created to visualize the data better
hist(sample_means150)
summary(sample_means150)
# Can be described that the shape of sampling distribution seems to be pretty similar to 
# the sample size of 50 which actually can beseen that the center distribution and the highest peak
# was approximately around 180000. Therefore, according to the histogram that I have, can be concluded and
# guessed that the mean sale price of homes in Ames to be around $180000.
# To sum up, both datasets looks like to have pretty much the same shape and center

# Problem 4
# Of the sampling distributions from 2 and 3, which has a smaller spread? If we're concerned with making estimates that are more often close to the true value, would we prefer a distribution with a large or small spread?
hist(sample_means50)
hist(sample_means150)
# After comparing those two histograms from problem 2 and 3, can be analyzed and seen that 
# variable sample_means150 from problem 3 has a smaller spread compared to variable
# sample_means50 from problem 2. This claim can be supported by the fact that histogram 3 obviously seems to have
# smaller spread since the range of y axix is clearly smaller compared to histogram 2
# Meanwhile, smaller spread distribution should be more preferred to estimate the true values



