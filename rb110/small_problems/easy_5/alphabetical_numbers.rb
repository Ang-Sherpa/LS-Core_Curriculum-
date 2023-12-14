# Write a method that takes an Array of Integers between 0 and 19, and returns an Array
# of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
# thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# input: an array of integers between 0 and 19
# output: an array of those Integers sorted based on the English words for each number
# explicit requirements
#     - return a new array of integers sorted based on the English words for each number
# algorithm
#     - create a hash of alphabetically ordered English words for numbers from 0 and 19
#         - interger is key and English word for the the number is the value
#     - inside the alphabetic_number_sort, create an empty array, alphabet_array
#     - iterate through the input array
#         - add the corresponding value of the hash to the array
#     - create an empty array with ordered integers, ordered_integers
#     - alphabetize the alphabet_array
#     - iterate through the alphabet_array
#         - use the elements in the alphabet_array to replace words with their integer equivalent
#     - return ordered array 

ALPHABETIC_NUMBERS_LIST = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
                            6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven',
                            12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifeteen', 
                            16 => 'sixteen', 17 => 'seventeen', 18 => 'eightteen', 19 => 'nineteen'}

def alphabetic_number(array)
  alphabet_array = []
  array.each do |num|
    alphabet_array << ALPHABETIC_NUMBERS_LIST[num]
  end
  alphabet_array.sort
end

def alphabetic_number_sort(array)
  ordered_array = []
  alphabetic_number(array).each do |word|
    ordered_array << ALPHABETIC_NUMBERS_LIST.key(word)
  end
  ordered_array
end 


p alphabetic_number_sort((0..19).to_a) == [
   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0]