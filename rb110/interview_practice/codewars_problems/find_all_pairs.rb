# You are given array of integers, your task will be to count all pairs in that array and return their count.

# Notes:
#     Array can be empty or contain only one value; in this case return 0
#     If there are more pairs of a certain number, count each pair only once. 
#     E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)

# Examples

# [1, 2, 5, 6, 5, 2]  -->  2

# ...because there are 2 pairs: 2 and 5

# [1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4

# ...because there are 4 pairs: 2, 20, 6 and 2 (again)

=begin

PROBLEM
input: array of integers
  - array can be empty or contain only one value --> return 0
output: return the count of all the pairs that occur in the array
  - If there are more pairs of a certain number, count each pair only once
  - 

EXAMPLES
- [1, 2, 5, 6, 5, 2]  -->  2 [2 and 5 have pairs]
- [1, 2, 2, 20, 6, 20, 2, 6, 2] --> 4 [2, 20, 6, 2 all have pairs]
  - to have a pair means divisible by 2 
  - count all the number that are repeated more than 1
    and divide by 2 can get the sum of all pairs 
  - 8 / 2 --> 4 (9 / 2 --> 4 integers round down)
  - 4 / 2 --> 2 pairs
  - 2 / 2 --> 1 pair
  - 2 / 2 --> 1 pair
- [0, 0, 0, 0] --> 4 / 2 --> 2
- [2, 2, 2, 3, 3, 3] --> 2 
  - count the number / 2 and add to sum
  - 2: 3 / 2  = 1 pair
  - 3: 3 / 2 = 1 pair 

DATA
input: array of integers
intermediate: sort the array by ascending order and get unique values
output: interger that rep. the number of pairs in the array 

NOTES
- sort the array by ascending order and get unique values --> ITERATE 
  - count how many times each number appears in the input array
    - add to the sum only if the number is greater than 1
- return sum / 2 n

ALGORITHM
1. init sum to 0
2. get the unique values of array and sort by ascending order and ITERATE (`number`)
  - add the count of number in the original array / 2 to sum
3. sum
=end

def pairs(array)
  sum = 0
  
  array.uniq.sort.each do |number|
    sum += (array.count(number) / 2)
  end

  sum
end




p pairs([1, 2, 5, 6, 5, 2]) #== 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
