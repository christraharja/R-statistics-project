# First of all, the source of data will be downloaded
download.file("http://www.openintro.org/stat/data/kobe.RData", destfile = "kobe.RData")
load("kobe.RData")
head(kobe)

# Problem 1
# Describe the distribution of streak lengths. What is the typical streak length for this simulated independent shooter with a 45% shooting percentage? How long is the player's longest streak of baskets in 133 shots?
# Firstly, we variable for streak length needs to be declared
outcomes <-c("H","M")
sim_basket <- sample(outcomes, size = 133, replace = TRUE, prob = c(0.45, 0.55))
streaklength <- calc_streak(sim_basket)
# Just in case we need the summary of the data,I will use summary function downhere
summary(streaklength)
# Afterward, barplot will be created to analyze the data 
barplot(table(streaklength))
# In addition, box plot might also help to understand deeper about the data
boxplot(streaklength)
# According to the bar plot, the distribution seems to skew to the right,
# I also found out that the typical strength lengths for this simulation are 0 and 1
# The longest streak of basket in 133 shots was found to be 6 based on the barplot
# The barplot was also supported by the box plot where can be seen that the peak is
# around 0 to 1 while the longest recorded was found to be 6 which is consistent with my bar plot
# The last but not least, from the summary of data, I found that the median was 0.5 
# whilst the mean was 0.8611 which convince me more that the typicall streak lenght was between 0 to 1
# besides that, the max was 6 which clarified my interpretation of both box and bar plots

# Problem 2
# If you were to run the simulation of the independent shooter a second time, how would you expect its streak distribution to compare to the distribution from the question above? Exactly the same? Somewhat similar? Totally different? Explain your reasoning.
# Based on the information that I have known, it seems that the result of streak distribution will be most likely somewhat similar
# This is due to the fact that shots are known to be independent from each other, hence,
# I also assume that the probability of shots does not change, therefore, it does not affect the streak distribution of this simulation

# Problem 3
# How does Kobe Bryant's distribution of streak lengths compare to the distribution of streak lengths for the simulated shooter? Using this comparison, do you have evidence that the hot hand model fits Kobe's shooting patterns? Explain.
# Barplots of both of them will be needed to see the difference between both of two cases
kobestreak <- calc_streak(kobe$basket)
barplot(table(kobestreak))
barplot(table(streaklength))
# By comparing those two bar plots, can be summarized that the streak distribution of Kobe was found to be
# somewhat similar to the simulation where both bar plots were skewed to the right
# with similar range as well, however, I feel that there is not sufficient evidence to claim
# that  the hot hand model fits shooting patterns because if the hot hand model is held for Kobe ,I could have more length of Kobe but in this case the length is only up to 4.



