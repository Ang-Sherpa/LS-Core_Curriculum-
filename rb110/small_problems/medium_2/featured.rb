=begin

input: one integer
output: next featured number that is greater than the arg

rules:
- A featured number = an odd number that is a multiple of 7, and
                      whose digits occur exactly once each
                      ex. 49 but not 133, 98, 97
- return the next featured number that is greater than the arg
- if there are no possible number
  print 

data structure:
- input: 1 integer
- intermediate: string version of the integer
- output: 1 integer

note/qs:
Conditons
  1. odd number (odd?)
  2. multiple of 7 ( % )
  3. digits must occur exactly once each (string version)
  4. must be greater than the arg (>)
  5. has to be the next featured number
- option
  - `number` / 7  = `multiple` ( 12 / 7 = 1)
  - increase `multiple` by 1
  - multiply `multiple` by 7 until the number is odd?
  - look at each digit to and make sure they only occur once
    if they occur more than once, go to the next iteration

algorithm:
** digit_occurs_once?(number)
1. transform the number into a string
2. is the uniq value of this string
    split the string in to chars and take the uniq values, join them
    compare with the original string
      if the same --> return true, otherwise false
** featured
1. init `final_number` to 0
2. init `multiple` to the return value of
    dividing `number` (input value) by 7
   increase the `multiple` by 1
3. loop until `final_number` meets all conditions
  a. reassign `final_number` to the return value of `multiple` * 7
  b. increase `mutiple` by 1
  c. if `final_number` is odd and the digit only occurs once
     return `final_number`
  d. otherwise, repeat the loop
=end

def digit_occurs_once?(number)
  number.to_s.chars.uniq.join == number.to_s
end

def featured(number)
  multiple = (number / 7) + 1
  final_number = multiple * 7

  loop do
    break if number >= 9_876_543_210
    return final_number if digit_occurs_once?(final_number) && final_number.odd?
    multiple += 1
    final_number = multiple * 7
  end

  'There is no possible number that fulfills those requirements'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)