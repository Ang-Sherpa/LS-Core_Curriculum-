# In this kata, you've to count lowercase letters in a given string and return
# the letter count in a hash with 'letter' as key and count as 'value'.
# The key must be 'symbol' instead of string in Ruby.

=begin

PROBLEM
input: string
  - only have alphabetic chars
output: hash with key as letter and count as value
  - key must be a symbol
  - order of the key by alphabetical order

EXAMPLES:
letterCount('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}

DATA
input: string
intermediate: unique array of sorted chars (ascending order)
output: hash (key is symbol for letter, value is count of the letter)

NOTES
- Option 1
  - get the unique array of char, sort it, and iterate through it
    - the hash key will be the current char turned into symbol
    - the value will be the count of the current char in the original string

ALGORITHM
1. init `hash` to an empty hash
2. turn string into an array of chars, get the unique values, sort it, and iterate through it (`char`)
  - the hash key of `hash` is equal to `char` as a symbol and the value is
    the count of `char` in the input string
3. return the `hash`
=end 

def letter_count(string)
  hash = {}
  string.chars.uniq.sort.each do |char|
    hash[char.to_sym] = string.count(char)
  end

  hash
end



p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
