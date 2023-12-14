# Complete the greatestProduct method so that it'll find the greatest
# product of five consecutive digits in the given string of digits.

# For example:

# greatestProduct("123834539327238239583") // should return 3240

# The input string always has more than five digits.

=begin

PROBLEM
input: string of digits
  - The input string always has more than five digits
output: greatest product of five conseq digits in the given string of digits

EXAMPLES
- greatestProduct("123834539327238239583") // should return 3240
  - need to take 5 conseq digits at a time
  - 12383, 23834, 38345, 83453, 34539 ... 39583
    - substring will always contin 5 digits, not need to go beyond length of string - 5 
  
DATA
input: string of digits
intermediate: array of product of subtrings turend into integers
output: integer rep. the max product of the 5 conseq digits 

NOTES
- ITERATE from 0 to (the length of string minus 5) (index)
   - init substring to a slice starting at index and the next 4 coseq digits (** 5)
   - ITERATE through the substring turning each digit into an integer and getting the product 
  
ALGORITHM
1. init substring_products to an empty array
2. ITERATE from 0 to (the length of string minus 5) (index)
   - init substring to a slice starting at index and the next 4 coseq digits (** 5)
   - ITERATE through the substring turning each digit into an integer and getting the product 
      - adding this product to the substring_products
3. return the max number in substring_products
=end

def greatest_product(string_digits)
  substring_products = []

  0.upto(string_digits.length - 5).each do |index|
    substring = string_digits[index, 5]
    
    substring_products << substring.chars.map(&:to_i).reduce(:*)
  end

  substring_products.max
end 

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0