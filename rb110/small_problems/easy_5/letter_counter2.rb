# Modify the word_sizes method from the previous exercise to exclude non-letters when 
# determining word size. For instance, the length of "it's" is 3, not 4.

# input: string with one or more space separated words
# output: a new hash that shows the number of words of different sizes.
# explicit requirements
#     - words consist of any string of chars that do not include a space
#     - exclude non-letters when determining word size
#     - return a hash with number of words of different sizes
# implicit requirements
#     - keys are the lengths of the words and values are how many words have that length
# algorithm
#     - create a new hash with default value of 0
#     - split the text into an array of words
#     - iterate through the array
#           - if the word contains non-alphabetic characters, remove it and get the length
#               - OR count the non-alphabetic characters and subtract the count from the length
#           - key is the length of array and value is 1 or adding 1 to the existing value
#     - return the new hash

def word_sizes(text)
  result = Hash.new(0)

  text.split.each do |word|
    word.gsub!(/\W/, '')
    result[word.length] += 1
  end
  result
end



p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}