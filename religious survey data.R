# Firstly, the data source will be downloaded downhere
download.file("http://www.openintro.org/stat/data/atheism.RData", destfile = "atheism.RData")
load("atheism.RData")
# View command will be used downhere to open the dataset for further analysis
Vies(atheism)

# Problem 1
# Answer the following two questions using the inference function. As always, write out the hypotheses for any tests you conduct and outline the status of the conditions for inference.
# Null hypothesis: the difference between 2005 and 2012 is zero
# Alternative hypothesis: the difference between 2005 and 2012 is not zero
# part a
# Is there convincing evidence that Spain has seen a change in its atheism index between 2005 and 2012?
# I will get the data from 2005 first
spain_2005 <- subset(atheism, nationality == "Spain" & year =="2005")
nrow(spain_2005)
spain_2005atheist <- subset(spain_2005, response == "atheist")
nrow(spain_2005atheist)
# Then, I will get the data from 2012
spain_2012 <- subset(atheism, nationality == "Spain" & year == "2012")
nrow(spain_2012)
spain_2012atheist <- subset(spain_2012, response == "atheist")
nrow(spain_2012atheist)
inference(spain_2005$response, est = "proportion", type = "ci", method = "theoretical", 
          success = "atheist")
inference(spain_2012$response, est = "proportion", type = "ci", method = "theoretical", 
          success = "atheist")
# Based on all information that I have, can be summarized that there was significant overlap 
# between confidence interval in 2005 and 2012 sample which basically means that we fail to reject the null
# hypothesis which corresponds to the change in atheism seems to be likely change
# part b
# Is there convincing evidence that the United States has seen a change in its atheism index between 2005 and 2012?
usa_2005 <- subset(atheism, nationality == "United States" & year =="2005")
nrow(usa_2005)
usa_2005atheist <- subset(usa_2005, response == "atheist")
nrow(usa_2005atheist)
# Then, I will get the data from 2012
usa_2012 <- subset(atheism, nationality == "United States" & year == "2012")
nrow(usa_2012)
usa_2012atheist <- subset(usa_2012, response == "atheist")
nrow(usa_2012atheist)
inference(usa_2005$response, est = "proportion", type = "ci", method = "theoretical", 
          success = "atheist")
inference(usa_2012$response, est = "proportion", type = "ci", method = "theoretical", 
          success = "atheist")
# According to all information that I have, can be concluded that there was not overlap
# between confidence interval in 2005 and 2012 sample which basically means that we reject the null hypothesis
# which corresponds to the change in atheism seems to be unlikely

# Problem 2
# If in fact there has been no change in the atheism index in the countries listed in Table 4, in how many of those countries would you expect to detect a change (at a significance level of 0.05) simply by chance?
# If there has been no change in atheism, then, in this case if we multiply 0.05 by total number of countries
# this will correspond to 1.95 change can be expected. 
# If we detect a change and reject the null hypothesis despite the fact that it is true
# actually means that type 1 error was involved in this case. As mentioned above when, change of 1.95 can be expected due to
# multiplying 39 countries that we have with 0.05 which resulted 1.95, then, might be rounded up to 2 countries

# Problem 3
# Suppose you're hired by the local government to estimate the proportion of residents that attend a religious service on a weekly basis. According to the guidelines, the estimate must have a margin of error no greater than 1% with 95% confidence. You have no idea what to expect for p. How many people would you have to sample to ensure that you are within the guidelines?
# If the margin or error given is 0.01, then, also given that the confidence interval is 95%
# I will be able to calculate the SE = 0.01/1.96 = 0.0051 if we make an assumption that p = 0.5
# As I knew the formula for SE = (p(1-p)/n)^(1/2), then, in order to be able to solve for n =
# (0.5*(1-0.5)/0.0051^2) which resulted 9604. So, can be concluded that I must include
# at least 9604 people.
# Downhere is the calculation 
z <- 1.96
x <- 0.01
p <- 0.5
answer <- ((z^2) * .25/x^2)


