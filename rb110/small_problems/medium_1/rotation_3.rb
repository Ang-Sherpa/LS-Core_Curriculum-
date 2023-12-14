=begin     

input: integer
output: maximum rotation of the integer

rules:
- return the max roataion of the input integer
- use `rotate_rightmost_digits` method
- do not have to handle multiple 0s
- if there is a zero and it becomes a leading 0, it's okay to drop that 0
ex. 7 3 5 2 9 1 (first element gets moved to the end of the array)
    3 5 2 9 1 7 (first element stays, and 2nd el gets moved to the end )
    3 2 9 1 7 5 (1st two els stay, and 3rd gets moved to the end)
    3 2 1 7 5 9 (1st three els stay)
    3 2 1 5 9 7
    3 2 1 5 7 9 (max rotation of org number)
- index of rotation -> 0, 1, 2, 3, 4
- for a digit with 6 digits, max # of rotations was 5

data structure:
-input: integer
-intermediate: string version of the input integer
               an array of chars
-output: integer

notes/ qs:
- rotate the array, array.size - 1 times
- 

algorithm: 
1. init `index` to 0
2. init `string_digit` to the string version of the input integer
3. init `chars_arr` to the split chars of `string_digit`
4. init `moving_element` to the element at `index` of `chars_arr`
5. loop until  `index` is equal to the length of `string_digit` minus 2
  a. 
=end

def max_rotation(digit)
  

end

def rotate_rightmost_digits(digit, n)
  chars_arr = digit.to_s.chars

  chars_arr[-n..-1] = rotate_array(chars_arr[-n..-1])
  chars_arr.join.to_i
end

def rotate_array(array)
  new_array = array.clone
  first_element = new_array.first

  new_array.delete_at(0)
  new_array << first_element

  new_array
end

p max_rotation(735291) #== 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845