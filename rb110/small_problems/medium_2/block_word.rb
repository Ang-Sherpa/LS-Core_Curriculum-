=begin

input: string obj (word)
output: boolean (if the word can be spelled from this set of blocks)

rules:
- Each letter in each block can only be used once
- two letters per block
  - B:O   X:K   D:Q   C:P   N:A
  - G:T   R:E   F:S   J:W   H:U
  - V:I   L:Y   Z:M
- treat all cases the same

notes/qs:
- array of block - nested array with each subarray holding two elements
  [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
    ['G', 'T'], ['R', 'E'], ['F', 'S'] ['J', 'W'], ['H', 'U'],
    ['V', 'I'], ['L', 'Y'], ['Z', 'M']]
- each subarray has front and back letters
- front and back letters cannot be used at the same time 
- one word can only use the block once ex. can't have 'BB'
-     blocks_hash = { 'B' => 'O',  'X' => 'K',   'D' => 'Q',  'C' => 'P', 'N' => 'A',
                  'G' => 'T',   'R' => 'E',   'F' => 'S',   'J' => 'W',  'H' => 'U',
                  'V' => 'I',   'L' => 'Y ',  'Z' => 'M'}

data structure:
- input: string object
- intermediate: either an array or hash of the blocks
                hash with key as first letter and value as second letter
                both key and value are string objects
- output: true or false (boolean)

algorithm:
1. init `blocks_array` to a nested array with each subarray 
   containing two elments
2. init  `index` to 0
3. init `checked_chars` to an empty array
4. iterate through each characted in the string
  a. init `current_array` to the current char and the next char at `index` + 1 index
  b. if the `current_array` is included in `blocks_array`
    - return false
  c. if the current char is included in `checked_chars`
    - return false
  d. otherwise
    - add char to `checked_chars`
  e. increase index by 1
5. implictly return true
=end

# BLOCKS_ARRAY = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
#                 ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
#                 ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

BLOCKS_HASH = { 'B' => 'O',  'X' => 'K',   'D' => 'Q',  'C' => 'P', 'N' => 'A',
  'G' => 'T',   'R' => 'E',   'F' => 'S',   'J' => 'W',  'H' => 'U',
  'V' => 'I',   'L' => 'Y ',  'Z' => 'M'}

def block_word?(string)
  index = 0 
  checked_chars = []
  cap_string = string.upcase

  cap_string.chars do |char|
    blocks_value = BLOCKS_HASH.key(char)
    return false if checked_chars.include?(BLOCKS_HASH[char]) || checked_chars.include?(blocks_value)

    checked_chars << char
    index += 1
  end

  true
end 


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('VOILa') == false
p block_word?('poeO') == false