=begin
PROBLEM
-input: array, object, block
-output: yield each element and object to the block
  - return the final value of the object
  - if array is empty, return the original object passed 
    as the second argument

ALGORITHM
1. iterate through the collection
  - pass in the element and object to the block
2. return the object
=end

def each_with_object(collection, list)
  collection.each { |element| yield(element, list)}
  list
end


result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}