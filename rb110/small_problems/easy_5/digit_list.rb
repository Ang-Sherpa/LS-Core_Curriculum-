# Write a method that takes one argument, a positive integer, and 
# returns a list of the digits in the number.

# input: a positive integer
# output: an array of digits in the number
# explicit requirements
#     - takes a positive integer and returns an array of digits in the number
# implicit requirements
#     - if there is one number, return it as the only element in the array
# algorithm
#     - convert the integer to string
#     - split the string into characters and iterate through the array
#           - add the integer transformation of each character into the array
#     - return the result

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true