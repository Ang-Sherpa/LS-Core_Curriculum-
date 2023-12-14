=begin

input: string
output: array that contains every word from the string
        with a space and the word length

rules:
- return array that contains every word from the string
  with a space and the word length ex. ['cow 3']
- words in the string are separated by exactly one space
- any substring of non-space characters is a word

data structure: 
-input: string
-intermediate: array of words to which I append a ' ' and word length
-output: array

notes/qs:
- create an array out of the string 
  - transform that array so that each element is 
    the `word` with a ' ' and word length

algorithm: 
1. make an array out of the `input_string`
2. iterate through the resulting array
  - transforming each `word` to the `word` with a ' ' and word length
3. return the resulting array


test case: word_lengths("cow sheep chicken")
1. [cow, sheep, chicken]
2. [cow 3, sheep 5, chicken 7]

=end

def word_lengths(input_string)
  input_string.split.map { |word| "#{word} #{word.length}" }
end 



p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []