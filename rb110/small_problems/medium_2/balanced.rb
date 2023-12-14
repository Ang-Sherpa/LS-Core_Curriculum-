=begin

input: string
output: returns true if all () in the string are properly balanced
        false otherwise


rules:
- balanced = parentheses occur in matching '(' and ')' pairs
           = # of '(' & # of ')' are equal  ***
           = 0 # 0f parentheses is balanced
- return true when () are balanced and false otherwise
- balanced pairs must each start with a ( not a ) ***

notes/qs:
- ["(", ")", ")", "(", "(", ")"] (parenthese_only_arr)
  if the array starts with ')' then I can return false 
  if  I see '(' then I can start a count of this until
    I see ')' --> then count that until I see '('
    and if the count of the '(' is equal to ')' then
    start both counts over 
  


data structure:
-input: string
-intermediate: hash with keys as '(' and ')' and values 
               as the # of times each one occurs in the string
-output: boolean


algorithm:
1. init `parentheses_hash` to a hash with keys as '(' and ')' 
   and values as 0
2. init `parenthese_only_arr` to an array 
   - selecting only '(' and ')' from the `input_str`
3. iterate through the `parenthese_only_arr`
  a. if the values of both keys in `parentheses_hash` are 0 && element is ')' 
    - return false
  b. increase the value of the key in `parentheses_hash` that matches the element by 1
  c. if the values of both keys in `parentheses_hash` are equal 
    - set both keys to 0
4. if the keys in `parentheses_hash` are equal return true otherwise false

=end

def balanced?(input_str)
  parentheses_hash = { '(' => 0 , ')' => 0 }
  parenthese_only_arr = input_str.chars.select { |char| (char == '(' ) || (char == ')') }

  parenthese_only_arr.each do |element|
    if ((parentheses_hash['('] == 0) && (parentheses_hash[')'] == 0)) && element == ')'
      return false
    else
      parentheses_hash[element] += 1
    end

    if parentheses_hash['('] == parentheses_hash[')']
      parentheses_hash['('] = 0
      parentheses_hash[')'] = 0
    end
  end

  parentheses_hash['('] == parentheses_hash[')']
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false

