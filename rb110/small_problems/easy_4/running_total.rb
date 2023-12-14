# Write a method that takes an Array of numbers, and returns an Array with the 
# same number of elements, and each element has the running total from the original Array.

# A running total is the sum of all values in a list up to and including the current element. 
# Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), 
# while the running total at index 3 is 47 (14 + 11 + 7 + 15).


# input: array of numbers
# output: array with the same number of elements, ea element has the running total from the original array
# explicit requirements
#     - return an array with the same number of elements
#     - each element in the array has to be the running total of the original array
#     - each subsequent number is the total + the current element
# implicit requirements
#     - first number of each array is the same
#     - if array is empty, return an empty array
# algorithm
#     - inside running_total method, initialize a new array, total_array to the first 
#       number in the given array, given_array
#     - loop through given_array and append the sum of the given_array[n] + total_array[n]
#     - return total_array

def running_total(given_array)
  total_array = []

  given_array.size.times do |num|
    total_array[num] = given_array[0, num + 1].sum
  end
  total_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
