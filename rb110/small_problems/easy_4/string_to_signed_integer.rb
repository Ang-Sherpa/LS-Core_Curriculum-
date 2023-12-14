# In the previous exercise, you developed a method that converts simple numeric strings to Integers. 
# In this exercise, you're going to extend that method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. 
# The String may have a leading + or - sign; if the first character is a +, 
# your method should return a positive number; if it is a -, your method should return a negative number. 
# If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, 
# such as String#to_i, Integer(), etc. You may, however, use the string_to_integer
#  method from the previous lesson.

NUM_HASH = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
             '6' => 6, '7' => 7, '8' => 8, '9' => 9 }.freeze


def get_power(string_num)
  if %w[+ -].include?(string_num[0])
    string_num.length - 2
  else
    string_num.length - 1
  end
end

def get_sign(string_num)
  if string_num.start_with?('-')
    -1
  else
    1
  end
end

def string_to_signed_integer(string_num)
  sum = 0
  power = get_power(string_num)
  sign = get_sign(string_num)

  string_num.each_char do |number|
    next if %w[+ -].include?(number)

    sum += NUM_HASH[number] * (10**power)
    power -= 1
  end

  sum * sign
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100



