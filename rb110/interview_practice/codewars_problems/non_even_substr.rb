# Given a string of integers, return the number of odd-numbered substrings that can be formed.

# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

# solve("1341") = 7. See test cases for more examples.

=begin

PROBLEM
input: string of integers
output: the number of odd-numbered substrings that can be formed
  - ex "1341" --> 1, 1, 3, 13, 41, 341, 1341 --> 7 number

EXAMPLES
# p solve("1341") == 7
  1, 1, 3, 13, 41, 341, 1341
# p solve("1357") == 10
  1, 13, 135, 1357    slice from 0, from 1 to 4 chars
  3, 35, 357          slice from 1, from 1 to 3 chars
  5, 57               slice from 2, from 1 to 2 chars
  7                   slice from 3, from 1 char
  count all the odd numbers

DATA
input: string
intermediate: array of substrings
              count of the odd-numbered substrings
output: integer rep the number of odd numbered substrings that can be formed 

NOTES
- ITERATE from 0 up to 1 minus the length of the string (idx)
  - ITERATE from 1 up to number (which starts at the length of the string) (num_of_chars)
    - add the slice from idx w/ num_of_char to the substring_array

ALGORITHM
1. init substring_array to an empty array
   init number to the length of string 
2. ITERATE from 0 up to 1 minus the length of the string (idx)
    - ITERATE from 1 up to number (which starts at the length of the string) (num_of_chars)
      - add the slice from idx w/ num_of_char to the substring_array
    - subtract 1 from number 
3. ITERATE through substring_array and transform the elements to integers and
   return the count of all odd numbers 

=end 

def solve(string)
  substring_array = []
  number = string.length

  0.upto(string.length - 1).each do |idx|
    1.upto(number).each do |num_of_char|
      substring_array << string[idx, num_of_char]
    end
    number -= 1 
  end 

  substring_array.map(&:to_i).count(&:odd?)
end



p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

