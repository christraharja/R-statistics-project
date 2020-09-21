# Firstly, I will download the source of data downhere
download.file("http://www.openintro.org/stat/data/nc.RData", destfile = "nc.RData")
load("nc.RData")
# Problem 1
# Calculate a 95% confidence interval for the average length of pregnancies (weeks) and interpret it in context. Note that since you're doing inference on a single population parameter, there is no explanatory variable, so you can omit the x variable from the function.
inference(y = nc$weeks, est = "mean", type = "ci", null = 0, 
          alternative = "twosided", method = "theoretical")
# According to the data summary that I have in th output, can be seen and concluded that basically
# 95% confidence level that the average pregnancy length of the given population was found to be between
# 38.1528 to 38 5165 weeks. Those two values are lower and upper bounds. In addition, the mean was calculated to be 38.3347 weeks
# Problem 2
# Calculate a new confidence interval for the same parameter at the 90% confidence level. You can change the confidence level by adding a new argument to the function: 
inference(y = nc$weeks, est = "mean", type = "ci", null = 0, 
          alternative = "twosided", method = "theoretical", conflevel=0.9)
# Based on the otput that I have, can be deduced that the average pregnancy length of the given population with 90% confidence interval was found to be
# between 38.182 to 38.4873 weeks. Those two values are lower and upper bounds. The mean was calculated and found to be 38.3347 weeks
# Problem 3
# Conduct a hypothesis test evaluating whether the average weight gained by younger mothers is different than the average weight gained by mature mothers.
inference(y = nc$gained, x=nc$mature, est = "mean", type = "ht", null = 0, 
          alternative = "twosided", method = "theoretical")
# According to the data that I have, can be summarized that we fail to reject the null hypothesis due to the fact that the p value was found to be 0.1686
# Therefore, to sum this up, can be said that there is no sufficient evidence that a difference in weight gain
# between young and mature mother exists
# Problem 4
# Now, a non-inference task: Determine the age cutoff for younger and mature mothers. Use a method of your choice, and explain how your method works.
# To solve this problem, for each group, I am planning to find minimum and maximum ages downhere
# Then, the data that I will get will be used for further analysis
by(nc$mage, nc$mature, summary)
# Based on the output that I have it seems that the cutoff was found between 34 and 35 
# the max age of younger moms was found to be 34 whilst the min age of mature mom was 35
# the method which I used was by printing max and min value for both mature and younger mom
# Problem 5
# Pick a pair of numerical and categorical variables and come up with a research question evaluating the relationship between these variables. Formulate the question in a way that it can be answered using a hypothesis test and/or a confidence interval. Answer your question using the inference function, report the statistical results, and also provide an explanation in plain language.
# H0 (null hypothesis): there is no significant between the means of children born from smoking versus non-smoking mothers
# Ha (alternative hypothesis): there is significant difference between the mean
# Downhere is the inference function that will be declared
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", null = 0, 
          alternative = "twosided", method = "theoretical")
# Based on the output and plot that I have, can be seen that the p value was found to be 0.0184
# In this case, the p value is 0.0184 which is less then 0.05 which is statistically significant, hence,
# I reject the null hypothesis and accpeth the alternative hypothesis which basically means that there is significant difference between the mean
