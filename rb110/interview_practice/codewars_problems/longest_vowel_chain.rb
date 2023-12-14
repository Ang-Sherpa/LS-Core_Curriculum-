# The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. 
# Given a lowercase string that has alphabetic characters only (both vowels and consonants) 
# and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou. 

=begin

PROBLEM
input: lowercase string 
  - only alphabetic chars 
  - no spaces
output: length of the longest vowel substring
  - Vowels are any of aeiou

EXAMPLES
# p solve("iuuvgheaae") == 4
  - eaae
   - if the char is consonant then next
   - otherwise, count the vowels until I hit a consonant or the end of the iteration
       - i u u --> sum = 3 
       - e a a e --> sum = 4
   - return the max_length

DATA
input: string
intermediate: a constant that points to an array of vowels
              an array of chars 
output: integer rep. the length of the longest vowel substring


NOTES
- VOWELS = w%(a e i o u)

ALGORITHM
** before method init VOWELS to an array of all the vowel in lowercase 
1. init `max_length` to 0
   init `current_length` to 0 
2. ITERATE through the array of char of the input string (char)
   - IF the char is included in VOWELS
    - add one to current_length
  - ELSE 
    - reassign current_length to 0
  -IF max_length is less than current_length
    - reassign max_length to current_length
3. return max_length

=end

VOWELS = %w(a e i o u)

def solve(string)
  max_length = 0
  current_length = 0

  string.chars do |char|
    if VOWELS.include?(char)
      current_length += 1
    else
      current_length = 0
    end

    max_length = current_length if max_length < current_length
  end

  max_length
end 





p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8