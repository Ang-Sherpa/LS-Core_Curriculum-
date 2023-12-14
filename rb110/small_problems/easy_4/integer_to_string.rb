DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  num_array = number.digits.reverse
  string_number = ''

  num_array.each do |num|
    string_number << DIGITS[num]
  end
  string_number
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
