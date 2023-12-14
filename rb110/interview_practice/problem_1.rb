# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

=begin 

PROBLEM
input: array of numbers
output: array of count of how many numbers are smaller than the number in the input Array
  - count only unique values
  - if a num occurs more than once, count it once


EXAMPLES:
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
  - if all the number are the same, just return an 
    array of 0s
p smaller_numbers_than_current([1]) == [0]


DATA:
input: array of integers
intermediate: array of unique elements 
              counts of each element that is smaller
output: array of integers (count)

NOTES:
- interate through the input array, transforming each element to the return value of the block
  - count how many elements in the input array with only unique values are less than the current value
- count method
  ex. array.count { |el| el < number }

ALGORITHM:
1. init `unique_arr` to the unique values of the input array
2. iterate through the input array (`number`)
  - count how many elements in the input array with only unique values are less than the current value
  - return the count to transform each element to the count 
=end

def smaller_numbers_than_current(array)
  unique_arr = array.uniq
  
  array.map do |number|
    unique_arr.count { |num| num < number }
  end 
end 



# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) #== [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".