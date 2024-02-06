=begin
PROBLEM
-input: sorted array of integers 
-output: an array that includes all of the missing integers
         in order btw the first and last elements of the arg

EXAMPLES
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
  1. compare -3 and -2 (no missing #s)
      index 0 and 1
  2. compare -2 and 1 (missing: [-1, 0])
      index 1 and 2
  3. compare 1 and 5 (missing: [2, 3, 4])
      index 2 and 3
missing([1, 2, 3, 4]) == []
  return empty array when no missing numbers found
missing([1, 5]) == [2, 3, 4]
missing([6]) == []
  return empty array when only 1 number given

ALGORITHM
1. INIT `result` to an empty array
2. iterate from 0 to two minus the size fo the array as `index`
    - INIT `current_value` to value at current `index` 
    - INIT `difference` to the value at next `index` minus value at current `index`
    - IF `difference` is greater than 1 
        - until `difference` is equal to 1
           - add one plus the value at current `index` to `result`
           - subtract 1 from difference
           - increment `current_value` by 1
3. return `result`
=end

def missing(array)
  result = []
  return result if array.size < 2
  
  0.upto((array.size - 2)) do |index|
    current_value = array[index]
    difference = array[index + 1] - current_value
    while difference > 1
      result << current_value + 1 
      difference -= 1
      current_value += 1
    end
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []