=begin   

Write a method that takes a string as an argument and returns
the character that occurs least often in the given string.
If there are multiple characters with the equal lowest number
of occurrences, then return the one that appears first in the
string. When counting characters, consider the uppercase and
lowercase version to be the same.

PROBLEM:
input: strinrg
  - can have alphanumeric or nonalphanumeric letter (ex. ' ')
output: return the char that occurs the least often the input string
  - if mult chars w/ equal lowest number of occurrences, return the one w/ the lowest index
  - uppercase and lowercase version are the same
  - return a lowercase letter even if orig. uppercase
  - return the char even if it is the only char that occures multiple times in a string

EXAMPLES:
p least_common_char("Hello World") #== "h"
  - 'h' occurs 1 and is the first char in the string

p least_common_char("Happy birthday!") #== ' '
  - ' ' occurs 1 and has the lowest index

p least_common_char("aaaaaAAAA") #== 'a'
  - 'a' is the only letter so return 'a'

DATA
input: string
intermediate: array of char
              count of each char
              hash w/ unique chars as keys and the number of occurrences at values
output: string -> one char

NOTES
- create an empty hash
- grab the unique values of an array of char of the input string
- iterate through this array (`key`)
    - the hash key is `key` and the value is the count of the number
      of time `key` occurs in the input string
- return the first key that has the lowest value

ALGORITHM
1. init `hash` as an empty hash
   init `lower_case_str` to a lowercase version of input string
2. grab the unique values of the array of char of the `lower_case_str`
  - iterate through this array (`key`)
    - the hash key is `key` and the value is the count of the number
      of times `key` occurs in the `lower_case_str`
3. grab the lowest value and then find the first key with that value
=end

def least_common_char(string)
  hash = {}
  lower_case_str = string.downcase

  lower_case_str.chars.uniq do |key|
    hash[key] = lower_case_str.count(key)
  end

  hash.key(hash.values.min)
end

# Examples:

least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".