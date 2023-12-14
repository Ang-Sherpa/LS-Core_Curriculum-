=begin

input: a digit and the number of rotations
output: a digit that has be rotated the number of times specified

rules:
- return a digit that has be rotated the number of times specified
- rotating just 1 digit results in the original number being returned
ex. 7 3 5 2 9 1 (1) --> 7 3 5 2 9 1
    7 3 5 2 9 1 (2) --> ' ' ' ' 1 9
    7 3 5 2 9 1 (3) --> ' ' ' 9 1 2
    7 3 5 2 9 1 (4) --> ' ' 2 9 1 5
    7 3 5 2 9 1 (5) --> ' 5 2 9 1 3
    7 3 5 2 9 1 (6) --> 3 5 2 9 1 7
- can assume `n` is always a positive integer
- `n` references the digit from the right
   so if `n` = 1 then it refers to the index at -1 
      if `n` = 2 then index = -2
 
data structure:
-input: integer
-intermediate: transform input integer to string
               transform string to an array of chars
-output: integer

notes/qs:
- can use negative integer to refer to `n`
- somehow grab the `-n` digit and move it to the back

algorithm:
1. init `chars_arr` to the split string version of the input integer
2. init `index` to negative `n` (2nd input integer)
3. init `value_at_n` to the char at the `index`
4. delete the char at that index from `chars_arr`
5. add `value_at_n` to the front of `char_arr`
6. use `rotate_array` to move the first element to the back
7. join the resulting array and transform it to an integer, return the return value
=end

def rotate_rightmost_digits(digit, n)
  chars_arr = digit.to_s.chars
  value_at_n = chars_arr[-n]

  chars_arr.delete_at(-n)
  chars_arr.unshift(value_at_n)

  rotate_array(chars_arr).join.to_i
end

def rotate_array(array)
  new_array = array.clone
  first_element = new_array.first

  new_array.delete_at(0)
  new_array << first_element

  new_array
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917