# There is an array with some numbers. All numbers are equal except for one. Try to find it!

# p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
# p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

# It’s guaranteed that array contains at least 3 numbers.

=begin  

PROBLEM
input: array with numbers (floats or integers)
  - all numbers are the duplicates except for one
  - array will contain atleast 3 numbers
output: the unique number in the array


EXAMPLES:
# p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
  - return the number that doesn't repeat
  - 2
# p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

DATA
input: array with numbers
intermediate: array of unique numbers
output: interger rep the number that doesn't repeat

NOTES
-keep track of the number that doesn't repeat (result)
- ITERATE through the array of unique numbers (`number`)
    return number if the count of the number in the input array is equal to one 

ALGORITHM
1. ITERATE through the array of unique numbers (`number`)
    return number if the count of the number in the input array is equal to one
=end

def find_uniq(array)
  array.uniq.each do |number|
    return number if array.count(number) == 1
  end
end


p find_uniq([1,1,1,1,0]) #== 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55