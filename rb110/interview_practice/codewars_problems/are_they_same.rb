# Given two arrays a and b write a function comp(a, b)
# that checks whether the two arrays have the "same" elements, with the same multiplicities 
# (the multiplicity of a member is the number of times it appears). "Same" means, here, 
# that the elements in b are the elements in a squared, regardless of the order.

# Examples
# Valid arrays

# a = [121, 144, 19, 161, 19, 144, 19, 11] 
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

# comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 
# 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. 
# It gets obvious if we write b's elements in terms of squares:

# a = [121, 144, 19, 161, 19, 144, 19, 11] 
# b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

=begin

PROBLEM
input: two arrays (a, b)
output: boolean, true if the two arrays have the "same" elements
  - same multiciplities -> the number of times a number appears 
  - "same" = elements in b are the elements in a squared, regardless of order


EXAMPLES:
# Valid arrays
# a = [121, 144, 19, 161, 19, 144, 19, 11] 
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
 - both arrays have 8 elements (same length)
 - every element in `a` is squared in `b` (in different order)

DATA
input: two array of integers
intermediate: sort both array into ascending order
output: boolean

NOTES
- compare the sorted a array and sorted b array
  such that every element in a should be squared in b
  if any of the elements doesn't follow this rule, explictly return false

ALGORITHM
- init sort_a to a sorted (ascending order)
- init sort_b to b sorted (ascending order)
- ITERATE through sort_a with index (number, index)
    if the number squared is not equal to the sort_b at index
      return false
- implictly return true
=end

def comp(a, b)
  sort_a = a.sort
  sort_b = b.sort

  sort_a.each_with_index do |number, index|
    return false unless number**2 == sort_b[index]
  end
  true
end

p comp([121, 144, 19, 161, 19, 144, 19, 11], [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true