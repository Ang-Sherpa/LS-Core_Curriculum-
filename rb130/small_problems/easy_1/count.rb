=begin
PROBLEM
-input: array and block
-output: returns a count of the times block returns true

EXAMPLES
p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

ALGORITHM
1. init `total` to 0
2. iterate through the collection
   - everytime the block returns true, add one to `total`
3. return `total`

=end

def count(collection)
  total = 0
  collection.each { |element| total += 1 if yield(element)}
  total
end

# Further Exploration: without using each, loop, while, or until.
# def count(collection)
#   collection.select { |element| yield(element)}.size
# end


p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
