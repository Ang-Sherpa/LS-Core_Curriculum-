=begin
PROBLEM
-input: array and implicit block
  - yield each consecutive pair of elements to the block

EXAMPLES
[1, 3, 6, 10] --> send to block
  1, 3  --> idx 0, 1
  3, 6  --> idx 1, 2
  6, 10 --> idx 2, 3 
  size = 4

DATA
-input: array
-intermediate: yield consec pair of elements 
  - element1 and element2
  - eleemnt2 and element3...
-output: nil

ALGORITHM
1. init `idx1` to 0
2. init `idx2` to 1
3. iterate until `idx2` is one less than the size of the array
 - yield the value at both indices to the block
 - increment `idx1` and `idx2` by 1
=end

def each_cons(array)
  idx1 = 0
  idx2 = 1

  while idx2 < array.size
    yield(array[idx1], array[idx2])
    idx1 += 1
    idx2 += 1
  end
end