# Write a method that takes a number as an argument. If the argument is a positive number,
# return the negative of that number. If the number is 0 or negative, return the original number.

# input = number as an argument (are floats okay?)
# output = negative of the number (unless number is already negative or is 0 then just the original number)

def negative(number)
  number > 0 ? -number : number
end

negative(5) == -5
negative(-3) == -3
negative(0) == 0
