# For a given nonempty string s find a minimum substring t and the maximum number k, 
# such that the entire string s is equal to t repeated k times.

# The input string consists of lowercase latin letters.

# return an array [t, k] (in Ruby and JavaScript)

# Examples:

# "ababab" ---> (t = "ab", k = 3)

# "abcde" ---> (t = "abcde", k = 1)
# because for this string, the minimum substring 't'
# such that 's' is 'k' times 't', is 's' itself

=begin

PROBLEM
input: nonempty string
  - only lowercase letters
output: array with min substring and the maximum number
  - substring * max_num = input string
  - ex. 'ab' * 3 = 'ababab'

EXAMPLES
f("ababab") == ["ab", 3]
  - a, ab, aba, abab, ababa, ababab 
  - substring * (length of input string / length of substring)
  - a * ( 6 / 1 = 6) 
  - ab * ( 6 / 2 = 3)
  - aba * (6 / 3 = 2)
  - abab * (6 / 4 = 1)
  - ababa * (6 / 5 = 1)
  - ababab * (6 / 6 = 1 )
  - return the one that can recreate the original string
f("abcde") == ["abcde", 1]

DATA
input: string
intemediate: array of substrings
output: an array with string and integer

NOTES
- [a, ab, aba, abab, ababa, ababab]
- start at 0, grab 1 value - length of input string
- ITERATE from 1 to length of input string (num_of_chars)
    grab a slice from 0 with num_of_chars
    if this slice * (length of input string / length of substring) == input string
      if the max_multiple is smaller than this number
        replace max_multiple with the number
        replace substring with the slice
      end
    end

ALGORITHM
1. init max_multiple to 0
2. init substring to an empty string
3. ITERATE from 1 to length of input string (num_of_chars)
    init slice to grab a slice from 0 with num_of_chars
    init multiple to (length of input string / length of slice)
    IF this slice * multiple is equal to input string
      IF the max_multiple is smaller than multiple
        replace max_multiple with multiple
        replace substring with the slice
4. return an array with elements substring and max_multiple in this order
=end

def f(string)
  max_multiple = 0
  substring = ''

  1.upto(string.length).each do |num_of_chars|
    slice = string[0, num_of_chars]
    multiple = string.length / slice.length

    if slice * multiple == string
      if max_multiple < multiple
        max_multiple = multiple
        substring = slice
      end
    end
  end

  [substring, max_multiple]
end 

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
