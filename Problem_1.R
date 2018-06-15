## Homework 4, Problem 1

library(dplyr)

## Read the data
houseWork <- read.csv('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/houseWork.csv')
str(houseWork)

## a)
summary(houseWork$sex)

## b)
muf <- mean(houseWork$hours[houseWork$sex == 'f'])
mum <- mean(houseWork$hours[houseWork$sex == 'm'])


## c)
houseWork$female <- ifelse(houseWork$sex == 'f', 'TRUE', 'FALSE')
houseWork$male <- ifelse(houseWork$sex == 'm', 'TRUE', 'FALSE')


## d)
fit <- lm(hours ~ female, data = houseWork)
summary(fit)


## e)It is a positive intercept that shows: if women are not involved in housework the work that will be done by all men is the average value of work hours by men per week
## The other coefficient is negative, which means that women overall work less on average so if we add another woman it would decrease the overall average working hours per week.

## f) the null hypothesis: H0 beta1 >= 0 then the alternative hypothesis is: H1 beta1 < 0
## The null hypothesis states that women's work hours contribute to the average population work hours and the alternative hypothesis states the opposite
## From the results of the linear model, we can reject the null hypothesis.

## g)
populationMean <- mean(houseWork$hours)
testStatistic <- sqrt(11016)*(muf - populationMean) / 0.3186
pt(testStatistic, df = 11014)


## h) There is zero probability to make a mistake when rejecting the null hypothesis if it is true, so we can reject the null hypothesis.

## i) The population follows a t-distribution. The expectations are that the distribution is normal, because we are estimating time values

## j)
fit1 <- lm(hours ~ female + male, data = houseWork)
summary(fit1)

## Y = beta0 + beta1*X1 + beta2*X2

