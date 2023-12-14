# Your goal is to write the group_and_count method, which should receive and 
# array as unique parameter and return a hash. Empty or nil input must return nil instead of a hash. 
# This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

# Example usage:

# input = [1,1,2,2,2,3]

# group_and_count(input)# == {1=>2, 2=>3, 3=>1}

# The following methods were disabled:
# Array#count
# Array#length

=begin

PROBLEM
input: array 
output: hash, keys are the unique values of the array and values are the count of each value
  - Empty or nil input must return nil
  - don't use #count or #length

EXAMPLES:
# input = [1,1,2,2,2,3]
# group_and_count(input)# == {1=>2, 2=>3, 3=>1}


DATA
input: array
intermediate: array of unique values of the input array
output: hash


NOTES
** return nil if input array is empty or nil 
- create an empty hash
- init count to 0
- grab the unique values of the input array (number)
  - ITERATE through the input array (num)
    - add one to count if num is equal to number
  - hash key is current number and count is the value
  - reset count to 0 

ALGORITHM
1. return nil if input array is empty or nil 
2. init result_hash to an empty hash
3. init count to 0
4. ITERATE through the unique values of the input array (number)
  - ITERATE through the input array (num)
    - add one to count if num is equal to number
  - hash key is current number and count is the value
  - reset count to 0
5. return result_hash
=end

def group_and_count(array)
  return nil if array.nil? || array.empty?

  result_hash = {}
  count = 0

  array.uniq.each do |number|
    array.each { |num| count += 1 if num == number }

    result_hash[number] = count
    count = 0
  end

  result_hash
end

p group_and_count([0,1,1,0]) #== {0=>2, 1=>2}

