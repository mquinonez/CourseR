# HOW TO USE REPS and SEQUENCES TO CREATE VECTORS FAST

# Create data for entire month's sales activity  
# date_28
# weekday_28
# daytype_28
# discount_28
# sales_28


# 1. Regular Sequence --------------------------------------------------------------- 
# date_28: Create 28 days in the month (4 week month)
# c(1,2,3,..)
date_28     <- 1:28
1:28

# 2. Create Repetitions -------------------------------------------------------------
# weekday_28: Create weekdays and daytype vector for 28 days by using 'rep' function
weekday_7 <- c("Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat")
weekday_28  <- rep(weekday_7, 4) 
weekday_28


weekday_28  <- rep(weekday_7, each=4) # to repeat each item n times
weekday_28


weekday_28  <- rep (weekday_7, 4) # Use earlier created vector to repeat
weekday_28


# daytype_28
daytype_7   <- c("WN", "WY","WY","WY","WY","WY","WN")
daytype_28  <- rep(daytype_7, 4) # Repeat factor vector 'daytype_7' four times
daytype_28
daytype_28 <- factor(daytype_28)
class (daytype_28) # Repeated variable is also factor



# discount_28: Create discount data for 28 days using rep function on numbers
discount_28  <- rep(c(1,1,1,0.5), 7)  # Discount pattern for every 4 days * 7 times = 28 days
discount_28
length(discount_28)



# 3. Create Sequence --------------------------------------------------------------------
# sales_28: Create sales data for 28 days, assuming 2 units increment every day
sales_28     <- seq(from=100, by = 2, length = 28) 
sales_28
length(sales_28)


sales_28     <- seq(from=100, to=150, length = 28)
sales_28




# Mini-Challenge -----------------------------------------------------------
# 1. Remember, you created the employee register. Now, create 
#    her monthly wage for next 12 months. Assume her starting wage as 
#    $1000 per month and it increases by $10 every month

# 2. Create the following sequence using only rep() and seq()
#    1000, 1000, 1000, 1200, 1200, 1200, 1400, 1400, 1400, 1600, 1600, 1600








# Solution -----------------------------------------------------------------
wage_rebecca <- seq(1000, by = 10, length = 12) 
wage_rebecca

# Solution 2
rep(seq(1000, by=200, length=4), each=3)
