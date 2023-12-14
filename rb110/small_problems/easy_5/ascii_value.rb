# input: string
# output: ASCII string value (sum of the ASCII values of all the characters in the string)
# explicit requirements:
#     - use String#ord to determine the ASCII value of every character in the string passed in as argument
#     - return the sum of the ASCII values
# implicit requirements:
#     - return an integer
#     - if the argument is empty, return 0
# algorithm:
#     - create a variable to reference the sum of the ASCII values
#     - iterate through the string and add the ASCII values of each character to the sum
#     - return the sum

def ascii_value(string)
  sum = 0
  string.each_char { |letter| sum += letter.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
