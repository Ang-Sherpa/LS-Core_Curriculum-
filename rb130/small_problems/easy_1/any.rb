=begin

PROBLEM
-input: array and a block (implicit or explicit?)
-output: true if block returns true for any of the elements
         false if block returns false or empty array arg
    - if any elements returns true, stops processing
  - cannot use all?, any?, none?, or one?

EXAMPLES
p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

DATA
-input: array and block
-intermediate: evaluation of the block return value
-output: boolean

ALGORITHM:
1. return false if the array arg is empty
2. for each element in the array 
  - return true if the block returns true
3. return false implictly
=end

def any?(array)
  array.each { |number| return true if yield(number) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false