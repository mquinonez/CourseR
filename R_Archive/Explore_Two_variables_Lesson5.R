##===============================================================
  
  ## Scatter Plot
getwd()
setwd('~/RInformation')
df <- read.delim('pseudo_facebook.tsv')

library(ggplot2)
df <- read.csv('pseudo_facebook.tsv', sep = '\t')

qplot(x = age, y = friend_count, data = df)
qplot(age, friend_count, data = df)

##observations from scatterplot: young users seem to have thousands of friends than most users over the age of 30.Vertical bars indicate people have lied about their age, like 69 and also about 100. Those users can be teenagers or fake accounts given the really high friend counts.  


qplot(x = age, y = friend_count, data = df)

ggplot(aes(x = age, y = friend_count), data =  pf) + geom_point() +
  xlim(13, 90)

summary(df$age)

##Overplotting: makes it difficult to tell how many points are in each region-to set the transparency of the points using the alpha parameter and geom point:
## alpha parameter equal 1 over 20 means that it's going to take 20 points to be the equivalent of one of the scatterplot black dots 

ggplot(aes(x = age, y = friend_count), data = df) +
  geom_point(alpha = 1/20) +
  xlim(13, 90)

## jitter Add a small amount of noise to a numeric vector; allows to add some noise to each age so we can get a clearer picture of the relationship about age and friend count and more accurate graph:
# we can see that we get a more sisperse distribution.Jittering reduces overplotting in ordinal data or data that are rounded. Jittering helps you to better visualize the density of the data and the relationship between variables. Jittering can help you to find clusters in the data.

ggplot(aes(x = age, y = friend_count), data = df) +
  geom_jitter(alpha = 1/20) +
  xlim(13, 90)

#adding jitter allows us to see that the counts for young users aren't nearly as high as they looked before. The bulk of youn users really ave friend counts below 1000. That's why we see these really dark regions along here.

##Coor_trans() coordinate transformation in Y axis: transformation allows to better visualize friend count, conditional on age. 

ggplot(aes(x = age, y = friend_count), data = df) +
  geom_point(alpha = 1/20) +
  xlim(13, 90) +
  coord_trans(y = 'sqrt')

##Alpha and Jitter

ggplot(aes(x = age, y = friendships_initiated), data = df) +
  geom_point(alpha = 1/10) +
  xlim(13, 90) +
  coord_trans(y = 'sqrt')

##Solution from video
ggplot(aes(x = age, y = friendships_initiated), data = df) +
  geom_jitter(alpha = 1/10, position = position_jitter(h = 0)) +
  coord_trans(y = 'sqrt')

##Conditional Means***Problematic

install.packages('dplyr')
library(dplyr)

age_groups <- group_by(df, age)
df.fc_by_age <- summarise(age_groups,
          friend_count_mean = mean(friend_count),
          friend_count_median = median(friend_count),
          n = n())
df.fc_by_age <- arrange(df.fc_by_age, age)

head(df.fc_by_age)


##common function in dplyr
filter()
group.by()
mutate()
arrange()

# to get same result as above the %.% the percent period percent function allows you to take your data set and apply some function to it.This allows user to chain functions onto our data set. Group data set by age and then chain one more function by summarizing the result using friend count mean in this case.
# friend count median, and an. Finally, add one more function using chain command. All these code is saved to a variable like above.

df.fc_by_age <- df %.%
  group_by(age) %.%
  summarise(friend_count_mean = mean(friend_count),
            friend_count_median = median(friend_count),
            n = n()) %.%
  arrange(age)

## to print out more rows just add number at the end of head: head(df.fc_by_age, 20)
head(df.fc_by_age)

df.fc_by_age <- df %.%
  group_by(age) %.%
  summarise(friend_count_mean = mean(friend_count),
            friend_count_median = median(friend_count),
            n = n()) %.%
  arrange(age)

head(df.fc_by_age, 20)


# Plot mean friend count vs. age using a line graph.
# Be sure you use the correct variable names
# and the correct data frame. You should be working
# with the new data frame created from the dplyr
# functions. The data frame is called 'pf.fc_by_age'.

# Use geom_line() rather than geom_point to create
# the plot. You can look up the documentation for
# geom_line() to see what it does.

# ENTER ALL OF YOUR CODE TO CREATE THE PLOT BELOW THIS LINE.
# ===========================================================


ggplot(aes(x = age, y = friend_count_mean), data = df.fc_by_age) +
  geom_line(alpha = 1/10, position = position_jitter(h = 0)) +
  coord_trans(y = 'sqrt')
ggsave('friend_count_mean.png')

##solution diagram is a dysplaying summary
ggplot(aes(x = age, y = friend_count_mean), data = df.fc_by_age) +
  geom_line()
ggsave('Solution_friend_count_mean.png')

#Overlaying Summaries with Raw Data - The fun.y parameter takes any type of function, so that we can apply it the y values. IN this case, we take the mean.
# `fun.y` is deprecated. Use `fun` instead.

library(ggplot2)
df <- read.csv('pseudo_facebook.tsv', sep = '\t')
ggplot(aes(x = age, y = friend_count), data = df) +
  coord_cartesian(xlim(13, 90)) +
  geom_point(alpha = 0.05,
             position = position_jitter(h = 0),
             color = 'orange') +
     coord_trans(y = 'sqrt') +
  geom_line(stat = 'summary', fun = mean) +
  geom_line(stat = 'summary', fun = quantile, 
            fun.args = list(probs = .1)) +
            scale_linetype_manual(values=c("twodash", color = 'blue'))

rlang::last_error()

###Have to work on fixing below

ggplot(aes(x = age, y = friend_count), data = df) +
  coord_cartesian(xlim = c(13, 90), ylim = c(0, 1000)) +
  geom_point(alpha = 0.05,
             position = position_jitter(h = 0),
             color = 'orange') +
  geom_line(stat = 'summary', fun = mean) +
  geom_line(stat = 'summary', fun = quantile, probs = .1,
            linetype = 2, color = 'blue') +
  geom_line(stat = 'summary', fun = quantile, probs = .5,
            color = 'blue') +
  geom_line(stat = 'summary',fun = quartile, probs = .9,
            linetype = 2, color = 'blue')


myplot <- ggplot(aes(x = age, y = friend_count), data = pf) +
  geom_point(alpha = 1/20, 
             position = position_jitter(h = 0),
             color = 'orange') +
  xlim(13,90)
myplot

myplot <- myplot + coord_trans(y = 'sqrt')
myplot

myplot <- myplot + geom_line(stat = 'summary', fun.y = mean)
myplot 

myplot <- myplot + geom_line(stat = 'summary', fun.y = quantile, probs = .1,
                             linetype = 2, color = 'blue')
myplot <- myplot + geom_line(stat = 'summary', fun.y = quantile, probs = .5,
                             linetype = 2, color = 'red')
myplot <- myplot + geom_line(stat = 'summary', fun.y = quantile, probs = .9,
                             linetype = 1, color = 'blue')

myplot
            
myplot <- myplot + coord_cartesian(ylim = c(0,1000), x = c(13,70))
myplot

#add quartile summaries
#probs = .1 == the 10% quartile
myplot <- myplot + geom_line(stat = 'summary', fun.y = quantile, probs = .1,
                             linetype = 2, color = 'blue')
myplot <- myplot + geom_line(stat = 'summary', fun.y = quantile, probs = .5,
                             linetype = 2, color = 'red')
myplot <- myplot + geom_line(stat = 'summary', fun.y = quantile, probs = .9,
                             linetype = 1, color = 'blue')

myplot

##Correlation
#Look up the documentation for the cor.test() function: What's the cor btw. age & friend count

cor.test(x = age, y = friend_count)

library(ggpubr)
ggplot(df, x = "age", y = "friend_count",
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Age", ylab = "Friend Count")

#Correlation - to look at the documentation type ?cor.test
?cor.test

df <- cor.test(df$age, df$friend_count,
               method = "pearson")
df

##	Pearson's product-moment correlation
#data:  df$age and df$friend_count
#t = -8.6268, df = 99001, p-value < 2.2e-16
#alternative hypothesis: true correlation is not equal to 0
#95 percent confidence interval:
#  -0.03363072 -0.02118189
#sample estimates:
#  cor 
#-0.02740737 

cor.test(df$age, df$friend_count, method = 'pearson')

with(df, cor.test(age, friend_count, method = "Pearson"))

setwd('~/RInformation')
pf <- read.delim('pseudo_facebook.tsv')

#Correlation on Subsets

with(subset(pf, age <= 70), cor.test(age, friend_count,
                                     method = 'pearson'))


##Pearson's product-moment correlation

data:  age and friend_count
t = -52.592, df = 91029, p-value < 2.2e-16
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.1780220 -0.1654129
sample estimates:
       cor 
## -0.1717245 (this result means that as age increases, number of friends decrease)


#Correlation Methods Correlation (Pearson, Kendall, Spearman)

## Create Scatterplots

library(ggplot2)
ggplot(aes(x = www_likes, y = www_likes_received), data = pf) +
  geom_point(alpha = 1/10, position = position_jitter(h = 0)) +
  coord_trans(y = 'sqrt')

myplot <- ggplot(aes(x = www_likes_received, y = likes_received), data = pf) +
  geom_point()
myplot

myplot <- ggplot(aes(x = www_likes_received, y = likes_received), data = pf) +
  geom_point(alpha = 1/100) + 
  coord_trans(x = 'sqrt')

myplot

#Strong Correlations

#Example from lecture removes a lot of rows and the distribution of the data looks more linear
library(ggplot2)
ggplot(aes(x = www_likes_received, y = www_likes), data = pf) +
  geom_point() +
  xlim(0, quantile(pf$www_likes_received, 0.95)) +
  ylim(0, quantile(pf$likes_received, 0.95)) +
  geom_smooth(method = 'lm', color = 'red')
 

#But examples from https://rpubs.com/mistophiles/ud651_Lesson4 are running great!
remove(myplot)

#plot the scatter
myplot <- ggplot(aes(x = www_likes_received, y = likes_received), data = pf) +
  geom_point()
myplot

#adjust the axes using the 95% quantile

myplot<- myplot + xlim(0,quantile(pf$www_likes_received,0.95)) +
  ylim(0,quantile(pf$www_likes,0.95))
myplot
  
# add the slope of the line of best fit through the point above is the correlation
#lm == lineear model


myplot <- myplot + geom_smooth(method = 'lm', color = 'red')
myplot
ggsave('ExampleFromRPubs.png')

##What's the correlation between the two variables? Include the top 5% of values for the variable in the calculation and round to 3 decimal places.

cor.test(x = pf$www_likes_received, y = pf$likes_received)
## 
##  Pearson's product-moment correlation
## 
## data:  pf$www_likes_received and pf$likes_received
## t = 937.1, df = 99001, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9473553 0.9486176
## sample estimates:
##       cor 
## 0.9479902

install.packages('alr3')
library(alr3)
data(Mitchell)
??Mitchell

https://rpubs.com/mistophiles/ud651_Lesson4

getwd()
setwd('~/RInformation')
pf <- read.delim('pseudo_facebook.tsv')

## https://www.r-bloggers.com/2013/01/how-to-install-packages-on-r-screenshots/

install.packages('alr4')
library(alr4)
data(Mitchell)
??Mitchell

head(Mitchell)

library(ggplot2)
ggplot(aes(x = Month, y = Temp ), data = Mitchell) +
  geom_point()

#or using qplot:

qplot(data = Mitchell, Month, Temp)

##Noisy Scatterplots: very weak correlation =  cor 
0.05747063 

cor.test(x= Mitchell$Month, y = Mitchell$Temp)

#Making Sense of Data - you get the range of 203 for the month: range(Mitchell$Month)

range(Mitchell$Month)

ggplot(data = Mitchell, aes(x = Month, y = Temp)) +
  geom_point() +
  scale_x_discrete(breaks = seq(0, 203, 12))

#A New Perspective: when graph is stretch out, it displays a cyclical patter.

#Understanding Noise: Age to Age Months

pf$age_with_months <- pf$age + (12 - pf$dob_month) /12 

##Two other solutions

pf$age_with_months <- pf$age + (1 - pf$dob_month / 12)

pf$age_with_months <- with(pf, age + (1 - dob_month / 12))

#Age with Months Means

library(dplyr)
pf.fc_by_age_months <- pf%>%
  group_by(age_with_months) %>%
  summarise(friend_count_mean = mean(friend_count),
            friend_count_median = median(friend_count),
            n = n()) %>%
  arrange(age_with_months)

head(pf.fc_by_age_months)



