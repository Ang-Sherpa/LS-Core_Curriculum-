=begin
PROBLEM
-input: two arrays 
-output: new two-element array 
  - [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
  - assume that both input arrays have the same number of elements

EXAMPELS
p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

ALGORITHM
1. init `result` to an empty array
2. iterate from 0 to 1 less than the length of an array (index)
  - add an array with the element at `index` of array 1 and the element at `index` of array 2
    to `result`
3. return `result`
=end

def zip(array1, array2)
  result = []
  0.upto(array1.size - 1) { |index| result << [array1[index], array2[index]] }
  result
end

# with each_with_index
# def zip(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << [element, array2[index]]
#   end
#   result
# end

# with each_with_index and with_object()
# def zip(array1, array2)
#   array1.each_with_index.with_object([]) do |(element, index), result|
#     result << [element, array2[index]]
#   end
# end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
