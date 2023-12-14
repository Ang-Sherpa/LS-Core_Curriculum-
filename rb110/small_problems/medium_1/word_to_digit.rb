=begin

input: string
output: returns the same string

rules:
- returns the same string with any sequence of the words 
  'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 
  'eight', 'nine' converted to a string of digits
- same string object is returned 
- spaces between each letter


data structure
  input: string
  intermediate: hash with string numbers as values and string obj as keys
    ex. word_numbers = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 
    'eight', 'nine']
    ex. ('0'..'9').to_a 
  output: same string but with modifications

notes:
- gsub! to sub the words to numbers

algorithm:
1. init `numbers_hash` to a hash with string word as keys and string number as values
2. iterate through the `numbers_hash`
      - replace the word with the value of the hash with the key of the hash
3. return `string_input`
=end

WORD_NUMBERS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 
  'eight', 'nine']
NUMBERS_HASH = ('0'..'9').to_a.zip(WORD_NUMBERS).to_h

def word_to_digit(string_input)
  NUMBERS_HASH.each { |key, value| string_input.gsub!(value, key) }

  string_input
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'