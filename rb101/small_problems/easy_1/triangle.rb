# Pseudocode:
# Given a positive interger, n, as an argument
# Set an empty array = []
# Set a spaces variable = n-1
# Set a stars variable = 1
#   - Iterate through the array until its length is n
#   - for each iteration push a string with n-1 spaces and stars # of star
#   - subtract 1 from n-1 spaces
#   - add 1 to stars
# After iterating through the array, print the array

def triangle(number)
  triangle_array = []
  spaces = number - 1
  stars = 1

  while triangle_array.size < number
    triangle_array.push("#{' ' * spaces}#{'*' * stars}")
    spaces -= 1
    stars += 1
  end

  puts triangle_array
end

triangle(5)
