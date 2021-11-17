
##s://daattali.gitbooks.io/stat545-ubc-github-io/content/block020_multiple-plots-on-a-page.html


getwd()
setwd('~/RInformation') 
dg <- read.delim('gapminderDataFiveYear.tsv') 


library(ggplot2)
names(dg)
qplot(x = gdpPercap, data = dg)
ggsave('gdpPercapBoxplot.png')


table(dg$country)
by(dg$gdpPercap, dg$country, summary)

qplot(x = lifeExp, data = dg, binwidth = 1,
      color = I('black'), fill = I('#099009'))
ggsave('lifeExp_color_Boxplot.png')

library(ggplot2)
names(dg)
qplot(x = lifeExp, data = dg,
      color = I('black'), fill = I('#099009')) +
      facet_wrap(~continent, ncol = 5)  
ggsave('lifeExp_color_BoxplotperContinent.png')

getwd()
setwd('~/All_about_R')
df <- read.delim('gapminderDataFiveYear.tsv')
 names(df)

 qplot(x = continent, data = dg,
       xlab = 'Continents',
       ylab = 'Number of Countries in Sample',
       color = I('black'), fill = I('#F79420'))
 scale_x_log10()
 ggsave('ContinentsBoxplot.png')
 

qplot(x = continent, y = gdpPercap, 
      data = subset(dg, !is.na(continent)), 
      geom = 'boxplot', ylim = c(0, 20000))
ggsave('gdpPercap_Continent.png')
 
by(dg$gdpPercap, dg$continent, summary)

qplot(x = lifeExp, data = subset(dg, !is.na(continent)),
      binwidth = 10) +
  scale_x_continuous(lim = c(0, 120), breaks = seq(0, 20, 100)) +
  facet_wrap(~continent)
 
qplot(x = lifeExp, data = subset(dg, !is.na(continent)), 
      binwidth = 10, geom = 'freqpoly', color = continent) +
 scale_x_continuous(lim = c(0, 120), breaks =  seq(0, 20, 100))
ggsave('lifeExp_continent.png')

by(dg$lifeExp, dg$continent, summary)

qplot(x = lifeExp, data = subset(dg, !is.na(continent)),
      binwidth = 5) +
  scale_x_continuous(lim = c(0, 120), breaks = seq(0, 10, 100)) +
  facet_wrap(~continent)

qplot(x = lifeExp, y = ..count../sum(..count..),
      data = subset(dg, !is.na(continent)),
      xlab = 'Life Expectancy',
      ylab = 'Proportion of continents with that Life Expectancy',
      binwidth = 5, geom = 'freqpoly', color = continent) +
  scale_x_continuous(lim = c(0, 120), breaks =  seq(0, 10, 100))
ggsave('lifeExp_continentwith_Yaxis')
