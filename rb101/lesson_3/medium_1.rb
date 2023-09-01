# Question 1

10.times do |number|
  puts "#{' ' * number}The Flintstones Rock!"
end

# Question 2

puts "the value of 40 + 2 is " + (40 + 2)
# Why is this an error and what are two possible ways to fix this?

# There are two different types of objects following the puts method.
# Ruby doesn't know how to concatenate an integer to a string
# In order to fix this, we can either use string interpolation on the integer (#{40 + 2})
# or we can use to_s method to turn the integer to a string [(40 + 2).to_s]

# Question 3

def factors(number)
  divisor = number
  factors = []

  return 'Zero division' if divisor.zero?

  return 'Negative number' if divisor.negative?

  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Question 4

# rolling_buffer1 method is an example of a pass by reference object passing strategy
# it passes a reference to a variable called buffer pointing to an array object
# using the shovel method (<<), the method mutates the original array object outside the method
# after the method is run, the buffer variable will be pointing the mutated objected
# this method return a meaningful value and causes side effects outside the method scope

# rolling_buffer2 method is an example of a pass by value object passing strategy
# it passes a copy of the array object that the variable input_array points to 
# the buffer variable is pointing to an array object that includes input_array 
# with the addition of a new element
# after running this method, the original input_array will still stay the same, no mutations
# this method only return a meaningful value (buffer) 

# Question 5

# the limit variable was initialize outside the method definition
# thus the method fib cannot access limit because methods have a self-contained scope
# You can initialize limit inside the method fib or add limit as an additiional argument and pass it

# Question 6

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# prints 34 because answer is still pointing to 42
# integers are immutable
# they can only be reassigned

# Question 7

# the family data remains intact because the each method will neither transform the hash
# nor mutate the original hash object
# the mess_with_demographics method will just return the original hash b/c each method returns itself
# in order to actually mess with the demographic data, Spot should have used map! to iterate through the hash

# Question 8

# rps("rock", "paper") -> paper
# rps("rock", "scissors") -> rock
# rps("paper", "rock") -> paper
# rps("paper", "rock") -> paper

# Question 9

# foo(bar) evaluates to "no"