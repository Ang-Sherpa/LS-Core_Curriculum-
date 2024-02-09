=begin
PROBLEM
-input: array and block
-output: the element with the largest value
  - if empty array, return nil

ALGORITHM
1. return nil if the array is empty 
2. init max_value to 0
3. iterate through each element in the array
  - yield the element to the block
  - if the block returns a value greater than max_value
      reassign max_value to the return value of the block
4. return max_value
=end

def max_by(collection)
  return nil if collection.empty?

  max_element = collection.first
  largest = yield(max_element)
  collection.each do |element|
    if largest < yield(element)
      max_element = element
      largest = yield(element)
    end 
  end
  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } #== 5
p max_by([1, 5, 3]) { |value| 9 - value } #== 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil