=begin
PROBLEM
-input: array and implicit block
-output: return nil
  - yield each consecutive pair of elements to the block

EXAMPLES
each_cons([1, 3, 6, 10], 2) --> send to block
  1, 3  --> idx 0, 1
  3, 6  --> idx 1, 2
  6, 10 --> idx 2, 3 
  size = 4

each_cons([1, 3, 6, 10], 3)
  1, [3, 6] --> idx 0, [1..2]
  3, [6, 10] --> idx 1, [2..3]
    - if idx + n (number of elements to pass) is greater
      than or equal to the size of the array then stop iteration
    - ex. idx 1 + 3 = 4
          array.size = 4

DATA
-input: array
-intermediate: yield n elements to the block
   - one element and then an array of 2 or more elements
   - ex. 3 elements --> 0, [1, 2] --> array[idx + 1, n - 1]
   - ex. 4 elements --> 0, [1, 2, 3]
-output: nil

ALGORITHM
1. iterate through each element with index
 - break if idx + `num_of_elements` is greater than or equal to the size of the array
 - when `num_of_elements` is 1
   - yield the element at idx
 - when `num_of_elements` is 2
   - yield the element at idx and idx + 1
 - else
    -yield element at idx and [element at idx + 1, n - 1]
2. return nil
=end

def each_cons(array, num_of_elements)
  array.each_with_index do |element, index|
    break if (index + num_of_elements) > array.size
      yield(*array[index..(index + num_of_elements - 1)])
  end
  nil
end


hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash #== { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash #== { 1 => [3, 6, 10] }