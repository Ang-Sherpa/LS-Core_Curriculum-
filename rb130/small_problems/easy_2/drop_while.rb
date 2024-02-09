=begin
PROBLEM
-input: array and implict block
-output: all the elements of the array except those elements at the beg
         that produce a truthy value from the block
  -if empty array, return an empty array
  -if true for every element, return an empty array 

EXERCISES
p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
  1, 2, 3
  array[3..-1]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
  
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

ALGORITHM
1. init `true_value` to true
2. iterate through each element with an object (array)
  - IF the block returns false
    - set `true_value` to false 
    - add the element to the array
  - ELSIF `true_value` is false && the block yields true
    - add the element to the array
=end

# def drop_while(collection)
#   true_value = true 
#   collection.each_with_object([]) do |element, result|
#     true_value = false if yield(element) == false
#     result << element if true_value == false
#   end
# end


# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []

def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end

  array[index..-1]
end

drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]