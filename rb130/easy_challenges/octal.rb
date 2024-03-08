=begin
PROBLEM
-input: octal input string
-output: decimal output
-rules
 - decimal = base-10 system
 - 233 # decimal
    = 2*10^2 + 3*10^1 + 3*10^0
    = 2*100  + 3*10   + 3*1
 - octal numbers use base-8
 - 233 # octal to decimal
    = 2*8^2 + 3*8^1 + 3*8^0
    = 2*64  + 3*8   + 3*1
    = 128   + 24    + 3
    = 155
 - from octal to decimal
 - nth digit gets multiplied by 8^n-1
 - if the input is not valid, return 0
  - cannot contain numbers ending in 8,9

EXAMPLES
   17
   1*8^1 + 7*8^0
   8 + 7

  155
  1*8^2 + 5*8^1 + 5*8^0
  1 * 64 + 40 + 5
  64 + 40 + 5 = 109

DATA STRUCTURE
-input: octal number as a string
-intermediate:
  - save the reverse of the string of the octal number
  - for the size of the string times
      get the element at the current index of the reversed string
      and multiple it by 8 to the current index power
  - sum the results which will be the decimal number
-output: decimal number (integer)

ALGORITHM
# initialize
- takes in an octal number and saves it

# valid_octal?
- returns false if the string includes any letters can use match?
  or if the string contains 7, 8, or 9

#to_decimal
1. return 0 unless the valid_octal? returns true
2. init `reversed_octal_num` to the reverse of octal_num
3. init `sum` to 0
4. iterate for the size of octal_num times tracking the `index`
  - add the value of the element at current index of the `reversed_octal_num`
    as an integer times 8 to the power of the value of the index to `sum`
=end

class Octal
  attr_accessor :octal_num

  def initialize(octal_num)
    @octal_num = octal_num
  end

  def valid_octal?
    !(octal_num.match?(/[a-z]|[8]|[9]|[\W]/i))
  end

  def to_decimal
    return 0 unless valid_octal?

    reversed_octal_num = octal_num.reverse
    sum = 0
    reversed_octal_num.chars.each_with_index do |num, exponent|
      sum += (num.to_i * (8**exponent))
    end
    sum
  end
end

