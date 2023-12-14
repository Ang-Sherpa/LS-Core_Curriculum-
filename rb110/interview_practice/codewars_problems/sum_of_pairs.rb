# Given a list of integers and a single sum value, return the first two values (parse from the left please) 
# in order of appearance that add up to form the sum.
# If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

# sum_pairs([11, 3, 7, 5],         10)
# #              ^--^      3 + 7 = 10
# == [3, 7]

# sum_pairs([4, 3, 2, 3, 4],         6)
# #          ^-----^         4 + 2 = 6, indices: 0, 2 *
# #             ^-----^      3 + 3 = 6, indices: 1, 3
# #                ^-----^   2 + 4 = 6, indices: 2, 4
# #  * the correct answer is the pair whose second value has the smallest index
# == [4, 2]

# sum_pairs([0, 0, -2, 3], 2)
# #  there are no pairs of values that can be added to produce 2.
# == None/nil/undefined (Based on the language)

# sum_pairs([10, 5, 2, 3, 7, 5],         10)
# #              ^-----------^   5 + 5 = 10, indices: 1, 5
# #                    ^--^      3 + 7 = 10, indices: 3, 4 *
# #  * the correct answer is the pair whose second value has the smallest index
# == [3, 7]

# Negative numbers and duplicate numbers can and will appear.

=begin  

PROBLEM
input: array of integer and an integer rep. sum
  - Negative numbers and duplicate numbers can and will appear.

output: return the first two values in order of appearance that add up to form the sum (array)
  - If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.
  - return nil if sum is not possible with the given elements

EXAMPLES:
# sum_pairs([4, 3, 2, 3, 4],         6)
# #          ^-----^         4 + 2 = 6, indices: 0, 2 *
# #             ^-----^      3 + 3 = 6, indices: 1, 3
# #                ^-----^   2 + 4 = 6, indices: 2, 4
# #  * the correct answer is the pair whose second value has the smallest index
# == [4, 2]
- [4, 3], [4, 2], [4, 3], [4, 4] --> starts at 0, (index 1 to length - 1)
- [3, 2], [3, 3], [3, 4]  --> starts at 1, (index 2 to length - 1)
- [2, 3], [2, 4] --> starts at 2, (index 3 to length - 1)
- [3, 4] --> starts at 3, (index 4 to length - 1)


DATA
input: array of integers and integer rep sum
intermediate: subarrays
output: array of a pair integers that add up sum 

NOTES

ALGORITHM
- init `smallest_second_idx` to nil
- init `result_pair` to an empty array
- init num to 1
- ITERATE through the input array keeping track of index (index)
    ITERATE from num to the (input array length - 1) (second_index)
     - init `subarray` to an array with the element at index of input array 
        and the element at second_index of input array
     - IF the sum of subarray is equal to sum
        - IF smallest_second_idx is nil or smallest_second_idx is bigger than second_index
            -reassign smallest_second_idx to second_idx
            -reassign result_pair to subarray
     - add one to num
- return nil if result_pair is empty 
- return result_pair 
=end

def sum_pairs(array, sum)
  smallest_second_idx = nil
  result_pair = []
  num = 1

  array.each_index do |index|
    num.upto(array.length - 1) do |second_index|
      subarray = [array[index], array[second_index]]
      
      if subarray.sum == sum && ( smallest_second_idx.nil? || smallest_second_idx > second_index )
        smallest_second_idx = second_index
        result_pair = subarray
      end
    end
    num += 1
  end

  return nil if result_pair.empty?

  result_pair
end

sum_pairs([4, 3, 2, 3, 4], 6)


l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]


p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]      
p sum_pairs(l3, -7) == nil  
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]           
p sum_pairs(l6, 8) == [4, 4]      
p sum_pairs(l7, 0) == [0, 0]  
p sum_pairs(l8, 10) == [13, -3]