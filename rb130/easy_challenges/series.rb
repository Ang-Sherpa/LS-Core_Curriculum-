=begin
PROBLEM
-input: string of digits and the length specification
-output: all the possible consec num seriers of a specifies length
         in that string
-rules:
  - throw an error if you ask for a series that has more
    numbers than the string of digits


EXAMPLES
- input: '01234' to 3-digit series
  012 (start: 0 stop: 2)
  123 (start: 1 stop: 3)
  234 (start: 2 stop: 4) 
  size of input = 5

- input: '01234' to 4-digit series
  0123 (start: 0 stop: 3)
  1234 (start: 1 stop: 4)
  stop when length of digit (5) - index number (1) = length of series

NOTES
- Series class
  - #initialize takes in a string digit
  - #slice(number) slices the digit and returns the consec
    num series of the specified length in nested arrays
    -raises an argument error if the size of string is smaller
     than the value of the argument passed in

DATA STRUCTURE
#initialize(digit)
- save the digit as chars array to an instance variable

#slices(length)
-input: length specification (integer)
-intermediate:
 - init result to []
 - length is determined by the input integer
 - iterate from 0 to to 1 minus the size of the main digit
    slice the main digit starting at the index, with length # of digits
    specified and wrap it in an array and add to result
-output: nested array of consec num series of the specified length
        # elements are integers

ALGORITHM
1. raise ArgumentError if length is greater than the size of the digit
2. init `result` to []
3. init `index` to 0
4. init `digit_arr` to digit as array of chars
3. while the index is less than or equal to the size of digit minus the length
     add to `result` slice from index to length to result
     increment `index` by 1
4. return result


Series.new('01234')
series.slices(2)
[[0, 1], [1, 2], [2, 3], [3, 4]]
+[["01"], ["12"], ["23"], ["34"]]

['0', '1', '2', '3', '4'] -> grab two values ['0', '1']
-> transform them to integers
=end

class Series
  attr_reader :digit_array

  def initialize(digit)
    @digit_array = digit.chars
  end

  def slices(length)
    raise ArgumentError if length > digit_array.size

    result = []
    index  = 0

    while index <= (digit_array.size - length)
      result << digit_array[index, length].map(&:to_i)
      index += 1
    end
    result
  end
end