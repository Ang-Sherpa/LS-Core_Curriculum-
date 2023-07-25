# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, 
# always starting with 1. The length of the string should match the given integer.

# inputs = a positive integer
# outputs = string of alternating 1s and 0s, always starting with 1

# input = 6
# output = '101010' (the length of this string = the input number)

# clarifying qs: what to do if the input value is a negative number or 0? 

# Define a method that takes in one argument which is a positive integer. Then use that number to create
# a string of that length with only 1s and 0s. This string should always begin with one, so if the number 
# is odd, the string should end with a 1.

# 1. Define a method called stringy that takes in a positive integer called number  
# 2. Create an empty string called result that will contain 1s and 0s 
# 3. Put 1s and 0s in the resulting string variable until its length is equal to number argument
# 4. Return result

def stringy(number)
  result = ''
  index = 0

  while result.length != number
    if index % 2 == 0
      result.concat('1')
      
    else 
      result.concat('0')
    end

    index += 1
  end 

  result

end



puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'