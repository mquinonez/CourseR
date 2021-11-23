# HOW TO CREATE A GROUP OF ELEMENTS IN A VECTOR

# 1. Create data for entire week's sales activity ----------------------------
# Create date, weekday, sales and discount data for one week
date_7      <- c(1,2,3,4,5,6,7)
date_7

date_7 <- 1:7
class(date_7)


#weekday
weekday_7   <- c("Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat")
weekday_7
class(weekday_7)

# sales
sales_7  <- c(100.0, 102.0, 104, 106, 108, 110, 112)
sales_7
class(sales_7)

# Create discount data for 1 week (1 = No discount, 0.5 = 50% discount)
discount_7 <- c(1, 1, 1, 0.5, 1, 1, 1)
class(discount_7)


# Assign weekday_7 as names of items in date_7
names(date_7) <- weekday_7
date_7
date_7['Mon']
date_7['Mon', 'Tue']  # wrong
date_7[c('Mon', 'Tue')]
date_7['Wed']

# 2. Create day type vector for one week (WN = Weekend, WY= Weekday) --------
daytype_7   <- c("WN", "WY","WY","WY","WY","WY","WN")
class (daytype_7)

# 3. Convert to Factor Class ------------------------------------------------
daytype_7   <- factor(daytype_7) # Creating factor format of daytype
class(daytype_7) # Factor class
daytype_7

# 4. How to access particular elements --------------------------------------
weekday_7[1]  # 1st item

#First 3 items
weekday_7[c(1,2,3)]
weekday_7[1:3]

# First and Third items
weekday_7[c(1,3)]


# 5. How to create a blank vector -------------------------------------------
char_vec  <- character(10)
char_vec
class(char_vec)
object.size(char_vec)  # 232 bytes


num_vec   <- numeric(10)
num_vec
class(num_vec)
object.size(num_vec)  # 176 bytes


int_vec <- integer(10)
int_vec
class(int_vec)
object.size(int_vec)  # 96 bytes


a <- 12
class(a)


a <- 12L
class(a)


logic_vec <- logical(10)
logic_vec
class(logic_vec)
object.size(logic_vec)  # 96 bytes



# Integer and Logical requires lowest space

# Combining vector
combined_vec <- c(weekday_7, daytype_7)
combined_vec

combined_vec2 <- c(weekday_7, discount_7)
combined_vec2



# Mini-Challenge -------------------------------------------------------------
#  Create a vector containing the numbers from 1 to 26. Assign names to the vector items as the alphabets from a-z. 
#  Extract the positions of vowels 'a', 'e', 'i', 'o', 'u'.

alphabet <- alphabet(26)
alphabet [1:26]
class(alphabet)


#  Solution ------------------------------------------------------------------
myvec <- 1:26
names(myvec) <- letters
myvec

myvec[c('a', 'e', 'i', 'o', 'u')]






