=begin
PROBLEM
-input: word and list of possible anagrams
-output: sublist of words that are anagrams of the word
-rules:
  - if no anagrams found, return empty array
  - the case of the letters doesn't matter
  - the same word doesn't count as an anagram
      ex. corn is not an anagram to corn
  - anagram = contains the same letters as the word but
    in a different order

EXAMPLES
'corn' and %w(corn dark Corn rank CORN cron park)
  returns ['cron']

DATA STRUCTURE
#initialize
-input: word
- save the word to an instance variable

#match
-input: word and array of words
-intermediate:
  - init an empty array called `sublist`
  - make a copy of the org. array and transform each
    word to a sorted version of itself
  - make a copy of the word and reassign to the transformed
    version of itself
  - iterate through the copy array with index
      add to `sublist` the element at the current index
      of the original array if the value of the sorted word
      matched the current element
-output: array of annagrams of the word

ALGORITHM
1. init `sublist` to an empty array
2. init `sorted_array` to a copy of `array` transformed
   so that each word is a sorted by chars and all lowercase
3. init `sorted_word` to a copy of the `word` sorted and lowercased
4. iterate through `sorted_array` with index
   IF the current element mateched the `sorted_word`
   AND the `word` is not the same as the word at the index (lowercased)
   then add the value of the `array` at the current index to
   `sublist`
5. return `sublist`

sorted_array = ["cnor", "adkr", "cnor", "aknr", "cnor", "cnor", "akpr"]
sorted_word = "cnor"

'corn' and %w(corn dark Corn rank CORN cron park)
  returns ['cron']
=end

# class Anagram
#   attr_reader :word

#   def initialize(word)
#     @word = word.downcase
#   end

#   def match(array)
#     sublist = []
#     sorted_array = array.map do |element|
#                      element.downcase.chars.sort.join
#                    end
#     sorted_word = word.chars.sort.join
#     sorted_array.each_with_index do |element, index|
#       if element == sorted_word && array[index].downcase != word
#         sublist << array[index]
#       end
#     end
#     sublist
#   end
# end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(word_array)
    word_array.select do |str|
      str.downcase != word && anagram?(str, word)
    end
  end

  def sorted_letters(str)
    str.downcase.chars.sort.join
  end

  def anagram?(word1, word2)
    sorted_letters(word1) == sorted_letters(word2)
  end
end
