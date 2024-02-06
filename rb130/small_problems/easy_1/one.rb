=begin
PROBLEM
-input: array and implicit block
-output: return true if the block returns true for exactly one of the elements
         return false otherwise
  - stop processing as soon as the block returns true a second time
  - return false if the array is empty

EXAMPLES
p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false

ALGORITHM
1. init `count_true` to 0
2. iterate through the collection
  - add one to count_true if the block returns true
  - explictly return false if `count_true` is more than one
3. return true if `count_true` is 1
   ELSE return false

=end

def one?(collection)
  count_true = 0
  collection.each do |element| 
    count_true += 1 if yield(element)
    return false if count_true > 1
  end
  count_true == 1 ? true : false 
end

# alternate solution offered
# def one?(collection)
#   seen_one = false
#   collection.each do |element|
#     next unless yield(element)
#     return false if seen_one
#     seen_one = true
#   end 
#   seen_one
#   end
# end


p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false