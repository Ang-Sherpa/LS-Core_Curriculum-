# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# input: string with one or more space separated words
# output: a new hash that shows the number of words of different sizes.
# explicit requirements
#     - words consist of any string of chars that do not include a space
#     - return a hash with number of words of different sizes
# implicit requirements
#     - keys are the lengths of the words and values are how many words have that length
#     - punctuations can count towards the word length (ex 'seven.' is 6 )
# algorithm
#     - create a new hash
#     - split the text into an array of words
#     - iterate through the array
#           - if a key (length of word) already exists, add one to the value
#           - if the key doesn't exit, length of the word is the key and value is 1
#     - return the new hash


def word_sizes(text)
  result = Hash.new(0)
  text.split.each do |word|
    result[word.length] += 1
  end
  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}


