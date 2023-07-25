# Write a method that takes a positive integer as an argument
# and returns that number with its digits reversed.

# Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. 

# input: number (however long)
# output: number in reverse (except when it ends with zeros)

# example 12345

def reversed_number(num)
  string_num = num.to_s

  string_num.reverse.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1