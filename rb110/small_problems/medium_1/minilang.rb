=begin

input: string obj with numbers and capitalized letters
output: perform the given commands

rules:
- each command operates on register (current value)
- register (current value) is not part of the stack
- commands that require 2 values pops the most recently
  pushed value from the stack
- performs the command using the popped value and the current value 
- then store the result back in the register
- list of commands
  - PUSH, ADD, SUB, MULT, DIV, MOD, POP, PRINT
  - `current_value` (init to 0)

data structure
- input: string
- intermediate: array of string objects
-               array that rep the stack (list of integers)
- output: depends on the command

notes/ qs:
- use #push & #pop
- how many sub_methods should I create?
  - one for each command?
  - group commands like (ADD, SUB, MULT, DIV)
- main methond = minilang
- keep track of current value and the values in the stack
    minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
    minilang('3 PUSH PUSH 7 DIV MULT PRINT ') # 6
      # current_value = 7
      # stack_arr [3, 3]
      # 7 / 3 
      # 2 * 3 

    minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
      # current_value = 4
      # stack_arr [4, 4]
      # 7 % 4 = 3
      # 3 * 4 = 12


algorithm:
**inside minilang
1. init `current_value` to 0
   init `number_in_arr` to nil
2. init `stack_arr` to []
3. init `string_arr` to input string split by spaces
4. init `basic_math_arr` to w%[ADD SUB MULT DIV]
5. iterate through the string_arr
  a. if the element is a number
    - reassign `current_number` to the element transformed into an integer
  b. if the element is "PUSH"
    - add `current_number` to `stack_arr`
  c. if the element is "POP"
    - remove the last element in `stack_arr` and 
      reassign `current_value` to the popped element
  d. if the element is included in `basic_math_arr`
    - init `last_element` to the last element in stack_arr 
    - reassign `current_value` to the result of basic_math(current_value, last_element)
  e. if the element is "MOD"
    - reassign `current_value` to the result of current_value % the last element of the stack 
    - remove the last element in stack_arr
  f. if the element is "PRINT"
    - print the `current_value`

** inside basic_math(element, current_value, last_element)
1. if the element == "ADD"
  a. add the last element and current_value
2. if the element == "SUB"
  a. subtract the last element and current_value
3. if the element == "DIV"
  a. divide the last element into current_value (current_value / last element)
4. if the element == "MULT"
  a. multiply the last element to current_value
=end

def basic_math(element, current_value, last_element)
  case element
  when 'ADD' then last_element + current_value
  when 'SUB' then current_value - last_element
  when 'MULT' then last_element * current_value
  when 'DIV' then  current_value / last_element
  end 
end 

def minilang(commands)
  current_value = 0
  stack_arr = []
  string_arr = commands.split(' ')
  basic_math_arr = ["ADD", "SUB", "MULT", "DIV"]

  string_arr.each do |element|
    if element.to_i.to_s == element
      current_value = element.to_i
    elsif element == 'PUSH'
      stack_arr.push(current_value)
    elsif element == 'POP'
      current_value = stack_arr.pop
    elsif basic_math_arr.include?(element)
      last_element = stack_arr.pop
      current_value = basic_math(element, current_value, last_element)
    elsif element == 'MOD'
      current_value =  current_value % stack_arr.pop
    elsif element == 'PRINT'
      puts current_value
    end
  end
end

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
minilang('-3 PUSH 5 SUB PRINT')
# 8