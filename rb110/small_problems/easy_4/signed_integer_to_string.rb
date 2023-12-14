DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].freeze

def signed_integer_to_string(number)
  num_array = number.abs.digits.reverse
  string_number = ''

  num_array.each do |num|
    string_number << DIGITS[num]
  end

  return string_number if string_number == '0'

  if number == number.abs
    string_number.prepend('+')
  else
    string_number.prepend('-')
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'