# A pangram is a sentence that contains every single letter of the alphabet at least once. 
# For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, 
# because it uses the letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. 
# Ignore numbers and punctuation.

=begin

PROBLEM
input: string
output: boolean, whether or not the string is a pangram
  - pangram is a sentence that contains every single letter of the alphabet at least once
  - ignore numbers and punctuation
  - case is irrelevant

EXAMPLES:
p pangram?("The quick brown fox jumps over the lazy dog.") == true
  - ignore the spaces and '.'
p pangram?("This is not a pangram.") == false
  - doesn't even have 26 letters 

DATA
input: string
intermediate: array of char (unique)
              array of all the letters in the alphabet as a constant
output: boolean

NOTES
- ALPHABET = ('a'..'z').to_a
- make sure you're working with a lowercase string
- string must have ALL the letters --> return false if not all are present
- OPTION 
  - get only the unique values of all the chars in the string in lowercase and sort 
  - if the ALPHABET is equal to this array of chars
      return true 
    otherwise false

ALGORITHM
** before method
- init ALPHABET to an array of all the lowercase letters
1. ITERATE through the ALPHABET array (char)
    IF the char is not included in the array of chars of input array
      return false
2. implicitly return true
=end

ALPHABET = ('a'..'z').to_a

def pangram?(string)
  ALPHABET.each do |char|
    return false unless string.chars.include?(char)
  end
  true
end 

p pangram?("The quick brown fox jumps over the lazy dog.") #== true
p pangram?("This is not a pangram.") # == false
