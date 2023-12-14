=begin

input: an array
output: new array with the first element at the end of the array

rules:
- return a new array with the first element at the end of the array
- do not use the method #rotate
- the original array should not be modified
- if the array only has one element, return an array with same element

data structure:
-input: array
-intermediate: a duplicate of the input array
-output: new array

notes/ qs:
- can use clone or dup to make a duplicate of the input array
- can use first to get the first 

algorithm:
1. init `new_array` to the duplicate of the input array
2. init `first_element` to the first element of `new_array`
3. delete the first element of `new_array`
4. add `first_element` to the end of `new_array`

=end

def rotate_array(array)
  new_array = array.clone 
  first_element = new_array.first

  new_array.delete_at(0)
  new_array << first_element

  new_array
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

def rotate_string(string)
  chars_array = string.chars
  rotate_array(chars_array).join
end

def rotate_integer(digit)
  chars_array = digit.to_s.chars
  rotate_array(chars_array).join.to_i
end

p rotate_integer(735291) == 352917
p rotate_integer(1234) == 2341

