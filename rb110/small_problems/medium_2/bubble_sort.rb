=begin   
P
input: array
output: bubble sorted array (same obj as input)

rules:
- you will mutate the Array passed as an argument
- assume that the Array contains at least 2 elements
- make multiple passes (iterations) through the Array
- On each pass, each pair of consecutive elements is compared
  ex. [6, 2, 7, 1, 4] -> 1. [6, 2] 2. [6, 7] 3. [7, 1] 4. [7, 4] (iterate agian until all sorted)
  ex. [1, 7, 0, 3] -> 1. [1, 7] 2. [7, 0] 3. [7, 3] (1st iteration of sorting)
- If the first of the two elements is greater than the second, then the two elements are swapped. 
- This process is repeated until a complete pass is made without performing any swaps
  - ending point is when no swaps are necessary
- elements in array can be any sortable object (such as string)

D
data structure
- input: array
- intermediate: array
- output: same but mutated array

notes/qs:
- ending point could be comparing sorted array with the current array
  - break out of the loop if the arrays are equivalent
- 1. compare two consecutive elements (index -1, index) until index == array.size
- 2. if the first is greater than the second --> swap places 
    first, last = [index -1, index] --> swap only if first > last
    first, last = last, first --> would that change the org object?
- 3. check and swap all of the elements and then check if it has been sorted

A
algorithm
1. loop until sorted array is equlivalent to the current array
  b. iterate from 1 up to 1 less than the size of the array
    - if the element in `array` at [index] > array[index + 1]
      - switch the two elements
    - increase index by 1
  c. break if the `array` is equal to a sorted version of `array`
2. return `array`
=end

def bubble_sort!(array)
  loop do
    1.upto(array.size - 1) do |index|
      if array[index - 1] > array[index]
        array[index - 1], array[index] = array[index], array[index - 1]
      end
    end

    break if array.sort == array
  end

  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)