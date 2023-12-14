# Count the number of Duplicates

# Write a function that will return the count of distinct case-insensitive 
# alphabetic characters and numeric digits that occur more than once in 
# the input string. The input string can be assumed to contain only alphabets 
# (both uppercase and lowercase) and numeric digits.

# Example

# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice

=begin 

PROBLEM
input: string
  - only alphanumeric chars
output: the count of distinct case-insensitive alphabetic characters and numeric digits
        that occur more than once in the input string
  - if input is empty, return 0


EXAMPLES
# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice


DATA
input: string
intermediate: array of unique chars in the input string 
              integer rep. count of the char that occur more than once 
output: integer rep the number of char that occur more than once in
        the input string

NOTES
- init lowercase_str to the lowercase version of the input string
- ITERATE through the array of unique chars in lowercase_str (char) 
    IF the count of the number char in lowercase_str is greater than 1
      - add one to the count

ALGORITHM
1. init lowercase_str to the lowercase version of the input string
2. init count_of_dups to 0
3. ITERATE through the array of unique chars in lowercase_str (char) 
    IF the count of the number of char in lowercase_str is greater than 1
      - add one to count_of_dups
4. return count_of_dups
=end

def duplicate_count(string)
  lowercase_str = string.downcase
  count_of_dups = 0

  lowercase_str.chars.uniq.each do |char|
    count_of_dups += 1 if lowercase_str.count(char) > 1
  end

  count_of_dups
end 


p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2