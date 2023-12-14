# Complete the function scramble(str1, str2) that returns true if a portion of str1 characters 
# can be rearranged to match str2, otherwise returns false.

# Notes:
# Only lower case letters will be used (a-z). No punctuation or digits will be included.

# Examples

# p scramble('rkqodlw', 'world') ==> True
# p scramble('cedewaraaossoqqyt', 'codewars') ==> True
# p scramble('katas', 'steak') ==> False

=begin

PROBLEM
input: two string object (str1 and str2)
  - only lowercase letters and no punctuations or digits 
output: boolean, true if a portion of str1 char can be rearranged to match str2


EXAMPLES
# p scramble('rkqodlw', 'world') ==> True
  -> sort both by ascending word order???
  -> could count each letter in string 2 and see it the count matches
     or is greater than the count in string 1 
# p scramble('cedewaraaossoqqyt', 'codewars') ==> True
  -> 
# p scramble('katas', 'steak') ==> False
  -> false becasue no 'e'


DATA
input: two string objects
intermediate: hash, key is the unique letters and value is the number of times they occur in a given string
output: boolean (whether or not the str1 char can match str2)

NOTES
- hash, key is the unique letters and value is the number of times 
  they occur in a given string
    - ITERATE through this hash
        if the value is greater than the count of the same letter in str1
          return false
    - return true 

ALGORITHM
1. ITERATE through the array of unique chars of str2 (char)
   - if the count of char in str2 is greater than the count of char in str1
      return false
      ex. ('rkqodlw', 'woorld') --> w: 1 !> 1 ; o: 2 > 1
2. implictly return true 
=end 

def scramble(str1, str2)
  str2.chars.uniq.each do |char|
    return false if str2.count(char) > str1.count(char)
  end
  true
end

p scramble('rkqodlw',           'world') #==  true
p scramble('cedewaraaossoqqyt', 'codewars') ==  true
p scramble('katas',             'steak') == false
p scramble('scriptjava',        'javascript') ==  true
p scramble('scriptingjava',     'javascript') ==  true