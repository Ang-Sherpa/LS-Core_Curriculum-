=begin
PROBLEM
-input: array and implicit block
-output: return true if the block returns false for all values
         otherwise false
  - stop processing as soon as block return true
  - if array is empty, return true

EXAMPLES
p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true

ALGORITHM
1. iterate through the collection
  - yield the element to the block, if the block returns true
    expliclty return false
2. impliclty return true
=end

def none?(collection)
  collection.each { |element| return false if yield(element) }
  true
end

# alternative solution using previous exercise
# def none?(collection, &block)
#   !any?(collection, &block)
# end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true