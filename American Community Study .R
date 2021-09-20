# Assignment: American Community Survey 
# Name: Colin Michael
# Date: 2021-09-18


#i.) The elements in the data and their categories are ID (integer), ID2 (integer), Geography (Enumerated), PopGroupID (integer), POPGROUP.display-label (Enumerated), RacesReported (integer), 
# HSDegree (float), BachDegree (float)

library(pastecs)
library(ggplot2)
library(qqplotr)

theme_set(theme_minimal())

setwd("/Users/colinmichael/Desktop/Data Science/DSC520")


community_df <- read.csv("acs-14-1yr-s0201.csv")

str(community_df)
nrow(community_df)
ncol(community_df)


com_histogram <- ggplot(community_df, aes(HSDegree))
com2<- com_histogram + geom_histogram(binwidth = 10) + ggtitle("High School Degree Distribution") + xlab("High School Degree") + ylab("Degree Count")
com2

#1.) Yes, the data is unimodel. It has one clear peak at 90.
#2.) The data is not symmetrical. The data peaks much more on the right compared to the left.
#3.) The data is not bell-shaped. It does not peak in the middle and taper to the left and right.
#4.) The data is not normally distributed.
#5.) The data is skewed to the right.
#6.) 

com_histogram2 = ggplot(data=community_df, aes(x=HSDegree)) + 
  geom_histogram(mapping = aes(y = stat(density)), fill='mediumorchid1', alpha=0.5, colour='black', binwidth =1 ) +
  stat_function(fun = dnorm, 
                args = list(mean = mean(community_df$HSDegree), sd = sd(community_df$HSDegree)),
                color = 'red') + ggtitle("High School Degree Distribution") + xlab("High School Degree") + ylab("Degree Count")
#Added a normal curve
com_histogram2 




#7.) A normal distribution is probability that is symmetric around the mean. The graph here shows that the data is not symmetrically around the mean.

#V.) Create a probability plot of HSDegree

prob_plot<- ggplot(mapping = aes(sample = community_df$HSDegree)) + stat_qq_point(size = 2, color = "green") 

prob_plot

#VI-1.) A normally distributed probability plot would show a straight line. The probability plot for "HSDegree" is not a straight line. It is curved toward the right, therefore not normally distributed.
#VI-2.) The data is skewed toward the right. The probability plot curves toward the right, showing a right-skew.

#VII.)

round(stat.desc(community_df$HSDegree, basic=TRUE, desc=TRUE, norm=TRUE, p=0.95), digits = 2)

#VIII.) The stat.desc shows a skewness of -1.67. Negative skewness shows a pile-up on the right side of the data, which this is. 
# A positive kurtosis shows a pointy and heavy-tailed distribution. This means there is a lot of data on the extremes, or edges of the distribution.
# The Skew.2Se, or Z score, is -4.03, showing not much data reliability in the sample size. The Kurt.SE is 5.27, showing that the sample of the population with high kurtosis is greater.
#Increasing the sample size will likely increase the data reliability, or the reliability of results.