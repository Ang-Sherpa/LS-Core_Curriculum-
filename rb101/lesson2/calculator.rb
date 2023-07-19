# Calculator with some bonus features

require 'yaml'

MESSAGES = YAML.load_file('calculator_msg.yml')
CHOICES = %w[1 2 3 4].freeze

def prompt(message, personalize = '')
  puts "=> #{MESSAGES[message] + personalize}"
end

def welcome
  prompt('welcome')
  prompt('get_name')
end

def get_valid_name(name)
  loop do
    return name unless name.strip.empty?

    prompt('invalid_name')
    name = gets.chomp
  end
end

def valid_number?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def get_valid_number(number)
  loop do
    return number if valid_number?(number)

    prompt('invalid_num')
    number = gets.chomp
  end
end

def set_first_number
  prompt('first_num')
  first_number = gets.chomp
  get_valid_number(first_number)
end

def set_second_number
  prompt('second_num')
  second_number = gets.chomp
  get_valid_number(second_number)
end

def get_valid_operator(operator)
  loop do
    return operator if CHOICES.include?(operator)

    prompt('invalid_op')
    operator = gets.chomp
  end
end

def set_operator
  prompt('operator_prompt')
  operator = gets.chomp
  get_valid_operator(operator)
end

def operation_to_message(operator, first_number, second_number)
  operation_msg = { '1' => 'Adding',
                    '2' => 'Subtracting',
                    '3' => 'Multiplying',
                    '4' => 'Dividing' }
  operation = operation_msg[operator] 
  puts "=> #{operation} #{first_number} and #{second_number} ..."
end

def calculate_result(operator, first_number, second_number)
  case operator
  when '1' then first_number + second_number
  when '2' then first_number - second_number
  when '3' then first_number * second_number
  when '4' then first_number / second_number
  end
end

def zero_division?(operator, second_number)
  operator == '4' && second_number.to_f.zero?
end

def get_nonzero_number(operator, second_number)
  loop do
    return second_number unless zero_division?(operator, second_number)

    prompt('zero_denom')
    second_number = gets.chomp
  end
end

def display_result(operator, first_number, second_number)
  result = calculate_result(operator, first_number, second_number)
  puts "=> The final result is #{result.round(5)}"
end

# Start of main program
welcome()

name = gets.chomp
name = get_valid_name(name).capitalize

prompt('user_name', "#{name}!")

# main loop
loop do
  first_number = set_first_number().to_f

  second_number = set_second_number().to_f

  operator = set_operator()

  second_number = get_nonzero_number(operator, second_number).to_f if zero_division?(operator, second_number)

  system('clear')

  operation_to_message(operator, first_number, second_number)
  display_result(operator, first_number, second_number)

  prompt('continue?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

  system('clear')
end

prompt('goodbye', "#{name}!")

# End
