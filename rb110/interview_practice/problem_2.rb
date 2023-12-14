# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

=begin

PROBLEM
input: an array of integers
  - integers can be negative
output: min sum of 5 consec integers in the array 
  - if the array has fewer than 5 elements, return nil


EXAMPLES
p minimum_sum([1, 2, 3, 4]) == nil
  - returns bc less 5 elements
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
  - return 1 + 2 + 3 + 4 + 5 = 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
  - return 2 + 6 + 5 + 1 + 2
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
  - return -1 -5 -3 + 0 -1 = 10


DATA
input: array of integers 
intermeditate: arrays with 5 conseq elements
               sums of arrays
output: Integer


NOTES
- [55, 2, 6, 5, 1, 2, 9, 3, 5, 100]
  - [55, 2, 6, 5, 1] --> start at 0 w/ 5 coseq els
  - [2, 6, 5, 1, 2]
  - [6, 5, 1, 2, 9]
  - [5, 1, 2, 9, 3]
  - [1, 2, 9, 3, 5]
  - [2, 9, 3, 5, 100] --> stop at length - 5
- min_sum
- iterate through the original array starting from 0 to (length - 5) `index`
  - slice starting w/ index and w/ 5 numbers
    - if the sum of this array is less than the min sum
      - reassign min_sum to the sum of the slice
- return the min_sum


ALGORITHM
- if the array has fewer than 5 elements, return nil
- init min_sum to 0
- iterate from 0 up to (length - 5) `index`
  - init sub_arr to slice of the orig array starting w/ index and w/ 5 numbers
    - if the sum of this array is less than the min_sum or min_sum is zero
      - reassign min_sum to the sum of sub_arr
- return the min_sum
=end

def minimum_sum(array)
  return nil if array.length < 5

  min_sum = 0

  0.upto(array.length - 5).each do |index|
    sub_arr_sum = array[index, 5].sum

    min_sum = sub_arr_sum if sub_arr_sum < min_sum || min_sum.zero?
  end

  min_sum
end

p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100])

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".