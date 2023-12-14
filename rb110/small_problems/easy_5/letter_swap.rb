# Given a string of words separated by spaces, write a method that takes this string of words and 
# returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always 
# contain at least one word. You may also assume that each string contains nothing but words and spaces.

# input: string of words
# output: a new string in which the first and last letters of every word are swapped
# explicit requirements
#     - return a string in which first and last letters of every word are swapped
#     - every word contains at least one letter
#     - string will always contain at least one word
#     - each string contains nothing but words and spaces
# implicit requirements
#     - return a new string
#     - if one letter string, returns the same string
# algorithm
#     - initialize two variables with empty strings: first_letter and second_letter
#     - iterate through the array, so that the first letter of each word is swapped with the last letter of that word
#           - for each word, assign the value of the first letter of the word to the variable first_letter
#           - assign the value of the last letter of the word to the variable last_letter
#           - change the value of the first letter of the word to value of last_letter 
#           - change the value of the last letter of the word to value of first_letter
#     - join the new array into a string and return the string

def swap(string)
  first_letter = ''
  last_letter = ''

  result = string.split.map do |word|
             first_letter = word[0]
             last_letter = word[-1]
             word[0] = last_letter
             word[-1] = first_letter
             word
  end

  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'