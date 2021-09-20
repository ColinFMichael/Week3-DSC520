# Assignment: ASSIGNMENT 3
# Name: Colin Michael
# Date: 2021-09-18

## Load the ggplot2 package

library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory

setwd("/Users/colinmichael/Desktop/Data Science/DSC520")

## Load the `data/r4ds/heights.csv` to

heights_df <- read.csv("heights.csv")


# https://ggplot2.tidyverse.org/reference/geom_point.html
## Using `geom_point()` create three scatterplots for
## `height` vs. `earn`
he<- ggplot(heights_df, aes(x=height, y=earn))
he + geom_point()
## `age` vs. `earn`
ae<- ggplot(heights_df, aes(x=age, y=earn))
ae + geom_point()
## `ed` vs. `earn`
ee<- ggplot(heights_df, aes(x=ed, y=earn))
ee + geom_point()

## Re-create the three scatterplots and add a regression trend line using
## the `geom_smooth()` function
## `height` vs. `earn`
he + geom_point() + geom_smooth()
## `age` vs. `earn`
ae+ geom_point() + geom_smooth()
## `ed` vs. `earn`
ee+ geom_point() + geom_smooth()

## Create a scatterplot of `height`` vs. `earn`.  Use `sex` as the `col` (color) attribute
he2<- ggplot(heights_df, aes(x=height, y=earn, col=sex))
he2 + geom_point()

## Using `ggtitle()`, `xlab()`, and `ylab()` to add a title, x label, and y label to the previous plot
## Title: Height vs. Earnings
## X label: Height (Inches)
## Y Label: Earnings (Dollars)

he2+ geom_point() + ggtitle("Height vs. Earnings") + xlab("Height (Inches)") + ylab("Earnings (Dollars)")

# https://ggplot2.tidyverse.org/reference/geom_histogram.html
## Create a histogram of the `earn` variable using `geom_histogram()`
e<- ggplot(heights_df, aes(earn))
e+ geom_histogram()

## Create a histogram of the `earn` variable using `geom_histogram()`
## Use 10 bins
e2<- ggplot(heights_df, aes(earn))
e2+ geom_histogram(binwidth = 10)

# https://ggplot2.tidyverse.org/reference/geom_density.html
## Create a kernel density plot of `earn` using `geom_density()`
ggplot(heights_df, aes(earn)) +  geom_density()


