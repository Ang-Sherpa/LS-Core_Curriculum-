# Write a function that accepts a string, and returns the same string with all 
# even indexed characters in each word upper cased, and all odd indexed characters 
# in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, 
# therefore that character should be upper cased and you need to start over for each word.

# The passed in string will only consist of alphabetical characters and spaces(' '). 
# Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').

# Examples:
# "String" => "StRiNg"
# "Weird string case" => "WeIrD StRiNg CaSe"

=begin

PROBLEM
input: string
  - only have alphabetical characters and spaces(' ')
  - Spaces will only be present if there are multiple words.
  - Words will be separated by a single space(' ')
output: same string w/ even indexed chars in each word upper cased
        and all odd indexed chars lowercased 
  - zero-based index - zero is even
  - start over for each word
  - not the same obj

EXAMPLES
# "String" => "StRiNg"
  -> even: S, r, n -> upper case
  -> odd: t, i, g  -> lower case 
# "Weird string case" => "WeIrD StRiNg CaSe"
  -> start over for each word 
    ex. W is zero index and S is zero index 
  --> letter at the beg of each word is capitalized 

DATA
input: string
intemediate: array of words
             array of chars 
output: same string w/ different casing 

NOTES
- keep track of index of each char in the word 
- ITERATE through an array of words (word) and transform each word
    ITERATE through an array of char with index and transform each char (char)
      capitalize char at even index
      lowercase the char at odd index
    join the chars into a word
  join the array of word with a space
  
ALGORITHM
1. ITERATE through an array of words (word) and transform each word
    ITERATE through an array of char with index and transform each char (char, index)
      capitalize char if even index
      lowercase char if odd index
    join the chars into a word
  join the array of word with a space
=end

def weirdcase(string)
  string.split.map do |word|
    weirdcase_word = ''

    word.chars.map.with_index do |char, index|
      if index.even?
        weirdcase_word << char.upcase 
      else   
        weirdcase_word << char.downcase
      end 
    end

    weirdcase_word
  end.join(' ')
end 


p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'

