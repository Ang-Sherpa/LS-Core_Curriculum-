=begin 
PROBLEM
-input: decimal number
-output: roman number equivalent to argument
-rules:
  - Roman number?
    - start with left most difit and skip any digit equal to 0
  - Max input is 3000
  - if the letter in front is less than the letter behind it
    - subtract the value of the smaller letter from the bigger letter
      - only applies to:
        - 4 (IV), 9 (IX), 49 (IL), 99 (IC), 499 (ID), IM (999)
        - 45 (VL), 95 (VC), 455 (VD), 995 (VD)
        - 40 (XL), 90 (XC), 490 (XD), 990 (XM)
        - CD (400), 900 (CM)
  - highest value letter comes first unless the lower value
    letter is being subtracted
      ex. MMVII = 2008
          1000 + 1000 + 5 + 1 + 1
      ex. CM = 900
          -100 + 1000
      ex. MDXC = 1590
          1000 + 500 + (-10) + 100
  - go from decimal number to roman numberal
    ex. 3008 --> 1000 + 1000 + 5 + 1 + 1 + 1
                   M      M    V   I   I   I
        1590 --> 1000 + 500 + 90
                  M      D    XC
        '3008'          

-questions:
  what is a roman number?
  - I, V, X, L, C, D, M
    - 1  => I
    - 5  => V
    - 10  => X
    - 50 => L
    - 100 => C
    - 500 => D
    - 1000 => M

EXAMPLES
 - 900 = CM
 - 90 = XC
 - 2008 = MMVII
 - 7 = VII
 - 2000 = MM
 - 8 = VIII
 - 1998 = MCMXCVIII

DATA STRUCTURE
#initialize
  - input: integer
  - save integer to an instance variable

#to_roman
  - input: number (calling object)
  - intermediate:
    - use hash constant to represent numbers with their RM equivalent
      - key is decimal number and value is the RM equivalent
    - use #to_s on the number to grab the size of the number
      and String#[] to grab the value in each place
  - output: string rep of the equivalent roman numberal

ALGORITHM
i. init NUM_TO_ROMAN to { 1 => 'I', 4 => 'IV', 5 => 'V'... }

#to_roman
1. return the value if the number matches a key in the hash
2. init `num_as_str` to the string version of the number
3. if the size of `num_as_str` is 4
    - init `thousands` to the first char in the string
    - init `hundreds` to the second char
    - init `tens` to the third char
    - init `ones` to the fourth char
   if the size of `num_as_str` is 3
    - init `hundreds` to the first char
    - init `tens` to the second char
    - init `ones` to the third char
   if the size of `num_as_str` is 2
    - init `tens` to the first char
    - init `ones` to the second char
   if the size of `num_as_str` is 1
    - init `ones` to the third char
4. init `roman` to an empty string
5. add to `roman` the 
=end 


=begin
PROBLEM
-input: decimial numbers (integer)
-output: equivalent roman numeral (string)
-rules:
  - roman numerals values
  - I, V, X, L, C, D, M
    - 1  => I
    - 5  => V
    - 10  => X
    - 50 => L
    - 100 => C
    - 500 => D
    - 1000 => M
   - Max input is 3000
   - if the letter in front is less than the letter behind it
    - subtract the value of the smaller letter from the bigger letter
      - only applies to:
        - 4 (IV), 9 (IX), 49 (IL), 99 (IC), 499 (ID), IM (999)
        - 45 (VL), 95 (VC), 455 (VD), 995 (VD)
        - 40 (XL), 90 (XC), 490 (XD), 990 (XM)
        - CD (400), 900 (CM)
   - **start with left most digit and skip any digit equal to 0

EXAMPLES
- thousand, hundreds, tens, ones
          M      CM      XC
  1990 =  1000 + 900  +  90  + 0 
          M      CM      XL    V  instead of VL??
  1945 =  1000 + 900  +  40  +  5
          M      CM      XC  + IX  instead of IC
  1999 =  1000 + 900  +  90  + 9
          D      L    XXV 
  575  =  500  + 70   +  5
                 50 + 20 + 5
- for the tens and ones place
    -look at both numbers and see if any of them match with
     the keys 
    -if not, look at them individually 

DATA STRUCTURE
ROMAN_TO_DECIMAL = { 1000 => 'M', 500 => 'D', 100 => 'C', 
                     50 => 'L', 10  => 'X, 5  => 'V', 1  => 'I'}
-input: integer
-intermediate:
-output: string rep of roman numeral

ALGORITHM
1. init `result` to an empty string
2. iterate over `ROMAN_TO_DECIMAL` hash
    -if the value of the current roman numeral(RN) is less than the value
    of the input, add the current RN to `result`
    - subtract the numeric value of the added RN from the current 
    input value
3. return `result` 
=end

class RomanNumeral
  attr_reader :decimal_number

  ROMAN_TO_DECIMAL = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @decimal_number = number
  end

  def to_roman
    result = ''
    to_convert = decimal_number
    
    while to_convert > 0 
      ROMAN_TO_DECIMAL.each do |roman, value|
        if value <= to_convert 
          result << roman 
          self.to_convert -= value
          break
        end
      end
    end
    result
  end
end

p RomanNumeral.new(27).to_roman