# HOW TO CREATE A SINGLE ELEMENT VECTOR

# 1. Create data for a day's sales activity -------------
month <- "sep_2019" # create month vector
month = "sep_2019"
month


# 2. See what variables are present in global namespace ------
ls()
rm(month)
ls()


#Clears the screen
cat('\14')

#3. Arrow in opposite direction also works -------------------
"sep_2019" -> month


#4. check class and length------------------------------------
class(month) #character class
length(month) # Equals 1


# 5. Create day of month -------------------------------------
day_of_month    <-   1.0 # Create date numeric vector
class(day_of_month) # Numeric class


# Store as integer
day_of_month    <-   1L
class(day_of_month) # integer



# 6. Change to Character -------------------------------------
day_of_month <- as.character(day_of_month) # Change class to character
day_of_month 
class(day_of_month)



# 7. Change back
day_of_month <- as.numeric(day_of_month) # Change back class to numeric
day_of_month
class(day_of_month)



# 8. Case Sensitive
Day_Of_Month <- 10 # Variables are case sensitive
Day_Of_Month
day_of_month





# 11. Mini-challenge ------------------------------------------
# Create a vector called year with value as 2021 and change to character

year <-2021
year <- as.character(year)
year
class(year)

# Solution ------------------------------------------------
year <- 2021
year
class(year)

year_char <- as.character(year)
year_char
class(year_char)
