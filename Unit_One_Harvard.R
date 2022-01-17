
fname = file.choose()
malpractice = read.csv((fname))

malpractice$Amount


malpractice2 = cbind(malpractice$Amount,malpractice$Specialty)

# here I create a subset data for just the uninsured
uninsured = malpractice[malpractice$Insurance == "No Insurance",]


head(uninsured <-malpractice[malpractice$Insurance == "No Insurance",])

# read in the bollywood dataset
bollywood = read.csv("http://www.datadescant.com/hbap/bollywood_boxoffice.csv")

bollywood$Gross.USD = bollywood$Gross*0.015
bollywood$Budget.USD = bollywood$Budget*0.015

bollywood$Profit.USD = bollywood$Gross.USD - bollywood$Budget.USD

hist(bollywood$Profit.USD)

sum(bollywood$Profit.USD > 0)

length(bollywood$Profit.USD)

mean(bollywood$Profit.USD > 0)

sum(bollywood$Profit.USD)

# Exercises for the "medicalmalpractice.csv"

mean(malpractice$Amount) #wrong calculation

# Correct answer:
obgyn = malpractice[malpractice$Specialty=="OBGYN",] 
mean(obgyn$Amount)

obgyn$Age
hist(obgyn$Age, breaks = 20)


#### Homework

# Problem 5: Airline data (this will be covered in the live session)

mydata=read.csv("airline2008Nov.csv")

# How many variables does it contain? How many obesrvations?  

dim(mydata)
# [1] 9997   27

# What airline has the most flights in the data set?

summary(mydata$UniqueCarrier)

max(summary(mydata$UniqueCarrier))
1414 # WN
plot(mydata$UniqueCarrier)

# 2. Write two questions that may be answered from this data set.



# 3. dealing with NA entries - https://uc-r.github.io/missing_values

mydata[!complete.cases(mydata),]

# Command to create data set without missing data

newdata <- na.omit(mydata)

# Command to write csv file  write.csv(newdata,"cleanairline.csv")

write.csv(newdata,"cleanairline.csv")


# 300 Observations removed - 9997 initial total observations

dim(newdata)
# [1] 9697   27 #new orbservations 9697

# If we analyze this data set and ignore the fact that we removed some observations
# we can cause bias in the estimation of parameters, reduce representatives of the samples
# we can be losing valuable information, we can draw inaccurate inferences about the data


# 4.a Crating a smaller data set using the subset command

smalldata=subset(mydata,Dest=="ATL"| Dest == "JFK" | Dest=="DFW" | Dest == "MSP")
smalldata$Dest=factor(smalldata$Dest)