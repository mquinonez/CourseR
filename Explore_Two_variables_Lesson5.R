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

age_groups <- group.by(df, age)
df.fc_by_age <- summarise(age_groups,
          friend_count_mean = mean(friend_count),
          friend_count_median = median(friend_count),
          n = n())
head(df.fc_by_age)


##common function in dplyr
filter()
group.by()
mutate()
arrange()



