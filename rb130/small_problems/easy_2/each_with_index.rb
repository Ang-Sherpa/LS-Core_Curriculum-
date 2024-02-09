=begin
PROBLEM
-input: array and implicit block
-output: yields each element and index number to the block
         returns a reference to the original collection
        
EXAMPLES
result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

ALGORITHM
1. init `index` to 0
2. iterate through the collection
  - yield `index` and `element` to the block
  - increment `index` by 1
3. return collection
=end

def each_with_index(collection)
  index = 0
  collection.each do |element|
    yield(element, index)
    index += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]