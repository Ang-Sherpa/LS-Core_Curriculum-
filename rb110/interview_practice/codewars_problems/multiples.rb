# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples 
# of 3 or 5 below the number passed in.

# Additionally, if the number is negative, return 0.

# Note: If the number is a multiple of both 3 and 5, only count it once.

=begin

PROBLEM
input: number
output: the sum of all the multiples of 3 or 5 below the number passed in
  - if the number is negative, return 0
  - If the number is a multiple of both 3 and 5, only count it once

EXAMPLES
- number = 10
    - 3, 5, 6, 9, --> 23
- number = 16
    - 3, 5, 6, 9, 10, 12, 15 --> 50
    - 1..16
      - grab the values that are multiple of either 3 or 5

DATA
input: integer
intermediate: array of multiples of 3 and 5
output: integer (sum)

NOTES
- ITERATE from 1 to the number (`number`)
    if number is evenly divisible by either 3 or 5
      add to the list of arrays
- return the sum of the array

ALGORITHM
1. init `result_arr` to an empty array
2. ITERATE from 1 to the input integer (`number`)
    if number is evenly divisible by either 3 or 5
      add number to result_arr
- return the sum of result_arr
=end 

def test(integer)
  result_arr = []

  (1...integer).each do |number|
    if number % 3 == 0 || number % 5 == 0
      result_arr << number
    end
  end

  result_arr.sum
end

p test(10) == 23
p test(20) == 78
p test(200) == 9168