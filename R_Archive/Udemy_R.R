a = 1
# Comment ------------------------------
install.packages('MASS')
install.packages((c('MASS', 'CAR'))
                 
            
                 
                 
                 
# heading 2 --------------------------


# Data Types

#character
class("the school is closed today. Yay!")

# numeric
123.01
123


#integer
123L

# logical
TRUE
FALSE
class(TRUE)

#convert between datatypes ------------------------------
# To numeric
as.numeric("123")
as.numeric("apple")
[1] NA

#To Character
as.character(123) 
as.character(TRUE) 

# To logical
as.logical("TRUE")
as.logical(123)
as.logical(1)
> as.logical(1)
[1] TRUE
as.logical(0)
> as.logical(0)
[1] FALSE
as.logical("apple")
> as.logical("apple")
[1] NA

