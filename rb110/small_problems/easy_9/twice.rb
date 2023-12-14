=begin    

input: number
output: 2 times the number provided as an argument
        unless the arg is a double num 
        for double num, return as is 

rules:
- double number = number with an even number of digits whose 
  left-side digits are exactly the same as its right-side digits
    ex. 44, 103103, 7676 --> even number of digits
- if double num, return the argument
  otherwise return double the argument

data structure:
-input: integer
-intermediate: string version of the integer 
-output: integer

notes:
- halve the digit  # 103103 --> 6 / 2 = 3  # 7676 --> 4 / 2 = 2
  (init `num_of_digits` to the length of the string version 
    and divide by half)
  (one half is a slice with `num_of_digits` starting at 0)
  (other half is a slice with `num_of_digits` starting at `num_of_digits` - 1)
- compare each half with the other
  - if equal, return orig integer
  - otherwise, return double orig integer


algorithm:
1. init `string_integer` to string version of `integer` 
   init `num_of_digits` to the string version of `integer` and get the length of 
    divided by half
2. if the length of string_integer is odd then return double of integer
2. init `first_half` to a slice starting at 0 with `num_of_digits` numbers
3. init `second_half` to a slice starting at (`num_of_digits`) with `num_of_digits` numbers
4. compare each half with the other
  - if equal, return `integer`
  - otherwise, return double `integer`

twice(103103)

1. num_of_digits = 6 / 2 = 3
   string_integer = '103103'
2. first_half = 103
3. second_half = 103
4. integer

=end 

def twice(integer)
  string_integer = integer.to_s
  return integer * 2 if string_integer.size.odd?

  num_of_digits = string_integer.size / 2

  first_half = string_integer[0, num_of_digits]
  second_half = string_integer[num_of_digits, num_of_digits]

  return integer if first_half == second_half

  integer * 2 
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10