# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

=begin

PROBLEM
input: array of integers
output: two number that are closest together in value
  - return in the order they appear 
  - return as array 
  - what happens when there are multiple values with the same difference
    ex. [12, 7, 17, 12] --> what to return? [12, 7] or [17, 12]

EXAMPLES:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
  - 15 - 11 = 4  --> [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
  - [19, 25], [19, 32], [19, 4], [19, 27], [19, 16] --> 1- 5
  - [25, 32], [25, 4], [25, 27], [25, 16] -> 2 - 5
  - [32, 4], [32, 27], [32, 16] -> 3 - 5
  - [4, 27], [4, 16] -> 4 - 5
  - [27, 16] -> 5
  - start at 0 and end at 2 minus the length of the array
    - each array has 2 numbers
  - second number
    - start from 1 and end at 1 minus the length of the array
p closest_numbers([12, 7, 17]) == [12, 7]


DATA
input: array of integers
intermediate: array of sub_arrays (checking each combo of two numbers)
output: array of two integers representing two numbers that are closest together in value

NOTES
- closest_values to an empty array
- min_diff to nil
- ITERATE through the input array with index (`idx`)
    - init sub_array to the slice of the input that starts at idx
      and contains two values
    - IF min_diff is nil or if the difference between the first value of sub_array
      and the second value of sub_array is less than min_diff
      ** make sure result of diff is in absolute value
        - update min_diff to the difference
        - reassign closes_values to sub_array
- return closest_values


ALGORITHM
1. init closest_values to an empty array
2. init min_diff to nil
   init num 
3. ITERATE from 0 to 2 minus the length of the input array (`idx`)
  - ITERATE from num to 1 minus the length of the input array (second_idx)
    - init sub_array to an array with the element at idx and element at second_idx of the input integers
    - IF min_diff is nil or if the difference between the first value of sub_array
      and the second value of sub_array is less than min_diff ** make sure result of diff is in absolute value
        - update min_diff to the difference
        - reassign closest_values to sub_array
  - add one to num
- return closest_values
=end 

def closest_numbers(array)
  closest_values = []
  min_diff = nil 
  num = 1

  0.upto(array.length - 2) do |idx|
    num.upto(array.length - 1) do |second_idx|
    sub_array = [array[idx], array[second_idx]] 
    
    if min_diff.nil? || (sub_array[0] - sub_array[1]).abs < min_diff
      min_diff = (sub_array[0] - sub_array[1]).abs
      closest_values = sub_array
    end
    end 
    num += 1
  end

  closest_values
end 




# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".