=begin
PROBLEM
-input: word
-output: Scrabble score
-rules:
  -Scrabble score: letter values table
  -letter case doesn't matter (all uppercase)
  - if the input is not a string, return 0
      ex. '', '\t', or nil

EXAMPLES
- CABBAGE
  3 + 2*1 + 2*3 + 2 + 1
  3 + 2 + 6 + 3
  5 + 9
  14

DATA STRUCTURES
-input: uppercase string
-intermediate: 
  - hash constant called LETTER_SCORES that contains the letter
    and its value
  - iterate through the array of chars of the string and add value
    of each char to the total
-output: scrabble score

ALGORITHM
#initialize
- take in a string and save a lowercase version

#score
i. init LETTER_SCORES to a hash with the letters as key and 
   values of letter as values ex. {'a' => 1, 'b' => 3}
1. init `total` to 0
2. iterate through the array of chars of the string
    - add the value of the current element from the hash to the `total`
3. return total
=end

class Scrabble
  attr_reader :word

  LETTER_SCORES = { 'a' => 1, 'b' => 3, 'c' => 3, 'd' => 2, 'e' => 1, 'f' => 4,
                    'g' => 2, 'h' => 4, 'i' => 1, 'j' => 8, 'k' => 5, 'l' => 1,
                    'm' => 3, 'n' => 1, 'o' => 1, 'p' => 3, 'q' => 10, 'r' => 1,
                    's' => 1, 't' => 1, 'u' => 1, 'v' => 4, 'w' => 4, 'x' => 8,
                    'y' => 4, 'z' => 10 }

  def initialize(word)
    @word = word.downcase unless word.nil?
  end

  def score
    return 0 if word.nil? || word.match?(/\s/)

    total = 0
    word.chars.each { |char| total += LETTER_SCORES[char] }
    total
  end

  def self.score(string)
    Scrabble.new(string).score
  end
end
