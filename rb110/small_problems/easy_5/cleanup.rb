# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, 
# write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
# If one or more non-alphabetic characters occur in a row, you should only have one space in the result 
# (the result should never have consecutive spaces).

# input: string that contains words (all lowercase) and non-alphabetic characters
# output: string without any non-alphabetic characters (replace with spaces)
# explicit requirements
#     - if one or more non-alphabetic characters occur in a row, replace with one space
#     - the result should never have consecutive spaces
#     - return a string without any non-alphabetic characters
# implicit requirements
#     - if the non-alphabetic characters are surrounded by spaces, no need to add another space

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_char = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_char << char
    else
      clean_char << ' ' unless clean_char.last == ' '
    end
  end
  clean_char.join
end

p cleanup("---what's my +*& line?") #== ' what s my line '