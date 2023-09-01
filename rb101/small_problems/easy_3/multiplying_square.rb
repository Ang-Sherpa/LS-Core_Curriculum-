# Create a method that takes two arguments, multiplies them together, and returns the result.

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3) == 15

# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument
# (the square is the result of multiplying a number by itself).

def square(num)
  multiply(num, num)
end

puts square(5) == 25
puts square(-8) == 64

# What if we wanted to generalize this method to a "power to the n" type method: cubed, to the 4th power,
# to the 5th, etc. How would we go about doing so while still using the multiply method?

def power(num, nth)
  # something
end

puts power(6, 3)
puts power(2, 3)
puts power(5, 2)
