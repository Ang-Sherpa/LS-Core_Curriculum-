# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

=begin

PROBLEM
input: string
output: string w/ same seq of chars w/ every 2nd char in every
        3rd word converted to uppercase
        other chars remains the same
        word is deliminated by spaces
        return the same string object or different? assuming not the same obj

EXAMPLES:
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
  every 3rd word = is, text, printing [2, 5, 8]
  every 2nd char = iS, tExT, pRiNtInG

p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
  every 3rd word = a, fact, reader, distracted [2, 5, 8, 11]
  every 2nd char = a, fAcT, rEaDeR, dIsTrAcTeD

p to_weird_case('aaA bB c') == 'aaA bB c'
  every 3rd word = c

DATA
input: string
intermediate: array of words
              array of chars
output: string

NOTES
- track getting the third_word_idx starting at 2 --> increase by three each time
- iterate through the array of words (word)
  - IF the word is equal to the word at the third_word_idx of the string 
    - iterate through each chars and keeping track of the index as well  (char, index)
      - return uppercase char if index is even
      - return the lowercase char if the index is odd
    - add the return value of the iteration to the new array
  -  add word if 
  - ELSE
    - add the current word to the new array
  - add three to third_word_idx
- join the new array w/ spaces in the middle 


ALGORITHM
- init third_word_idx to 2
- init new_array to an empty array
- init string_arr to an array of words in the string 
- iterate through string_arr (word)
  - IF the word is equal to the word at the `third_word_idx` of the string
    - init index to 0
    - iterate through each chars (char)
      - return uppercase char if index is even
      - return the lowercase char if the index is odd
      - add one to index
      - add three to third_word_idx
    - add the return value of the iteration to the new_array
  - ELSE
    - add the current word to the new_array
- join new_array w/ spaces in the middle
=end

def to_weird_case(string)
  third_word_idx = 2 
  new_array = []
  string_arr = string.split

  string_arr.each do |word|
    index = -1

    if string_arr[third_word_idx] == word
      new_array << word.chars.map do |char|
                     index += 1
                     if index.even?
                      char 
                     else 
                      char.upcase!
                     end 
                   end.join
      third_word_idx += 3
    else
      new_array << word 
    end
  end

  new_array.join(' ')

end 


# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing')# ==
               'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

