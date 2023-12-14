# input: string of digits
# output: equivalent integer
# explicit requirements:
#     - cannot use methods such as String#to_i or Integer()
#     - turn string of digits into equivalent integer
#     - no need to look out for: leading + or - signs or invalid characters
#     - analyze each character in the string
#     - return an integer
# algorithm
#     - inside the string_to_integer method, initialize a sum variable to 0
#     - create a hash with keys as string numbers and values as integer number (0-9, example '4' => 4 )
#     - loop through each character in the string, and access the hash values via character key
#       depending on the string's length, multiply by the value its place in the string number
#       and add the number to sum
#     - return the sum

NUM_HASH = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, 
             '6' => 6, '7' => 7, '8' => 8, '9' => 9 }.freeze

def string_to_integer(string_num)
  sum = 0
  power = string_num.length - 1
  string_num.each_char do |number|
    sum += NUM_HASH[number] * (10**power)
    power -= 1
  end
  sum
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
