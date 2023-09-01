# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a character.

def count_characters(string)
  string.delete(' ').length
end

puts 'Please write word or multiple words:'
input = gets.chomp

puts "There are #{count_characters(input)} characters in \"#{input}.\" "
