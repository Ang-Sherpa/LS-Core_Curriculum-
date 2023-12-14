# You are going to be given an array of integers. Your job is to take that array and 
# find an index N where the sum of the integers to the left of N is equal to the sum of the 
# integers to the right of N. If there is no index that would make this happen, return -1.

# For example:

# Let's say you are given the array {1,2,3,4,3,2,1}:
# Your function will return the index 3, because at the 3rd position of the array, the sum of 
# left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

# Let's look at another one.
# You are given the array {1,100,50,-51,1,1}:
# Your function will return the index 1, because at the 1st position of the array, the sum of 
# left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

# Last one:
# You are given the array {20,10,-80,10,10,15,35}
# At index 0 the left side is {}
# The right side is {10,-80,10,10,15,35}
# They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
# Index 0 is the place where the left side and right side are equal.

# Input:
# An integer array of length 0 < arr < 1000. The numbers in the array can be any integer 
# positive or negative.

# Output:
# The lowest index N where the side to the left of N is equal to the side to the right of N. 
# If you do not find an index that fits these rules, then you will return -1.

# Note:
# If you are given an array with multiple answers, return the lowest correct index.

=begin

PROBLEM
input: array of integers
  - The numbers in the array can be any integer, positive or negative.
output: return an index N where the sum of the integers to the left of N 
        is equal to the sum of the integers to the right of N
  - if there is no index that can make this happen, return -1
  - The lowest index N where the side to the left of N is equal to the side to the right of N
  - If you are given an array with multiple answers, return the lowest correct index
  - an empty array sums to 0 

EXAMPLES:
- [1,2,3,4,3,2,1] --> return 3 
    --> [1, 2, 3] (6) == [1, 2, 3] (6) (take out the index that splits the two)
    --> LHS: [0..2]; RHS: [4..6]
- [20,10,-80,10,10,15,35] --> return 0 
    --> [] (0) == [10,-80,10,10,15,35] (0)

- [1,100,50,-51,1,1] --> return 1
    --> [1] (1) == [50,-51,1,1] (1)
    --> LHS: [], RHS [100,50,-51,1,1] --> index is 0
    --> LHS: [1], RHS [50,-51,1,1]  --> index is 1 
    --> LHS: [1, 100], RHS [-51,1,1] --> index is 2
    --> LHS: [1, 100, 50], RHS [1,1] --> index is 3 

DATA
input: array of integers
intermediate: array of RHS integers and array of LHS integers
output: integer rep the index at which the sum of integer 
        to the left and to the right is equal

NOTES
- ITERATE through the input array with index (`index`)
    - init left_arr to a slice starting at 0 and containing `index` number of digits
    - init right_arr to a slice starting at index + 1 containing length of the input array
    - return index if the sum of left_arr is equal to right_arr 

ALGORITHM
1. ITERATE through the input array with index (`index`)
    - init left_arr to a slice starting at 0 and containing `index` number of digits
    - init right_arr to a slice starting at index + 1 containing length of the input array
    - return index if the sum of left_arr is equal to right_arr
2. implictly return -1 
=end

def find_even_index(array)
  array.each_index do |index|
    left_arr = array[0, index]
    right_arr = array[(index + 1), array.length]

    return index if left_arr.sum == right_arr.sum
  end

  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1