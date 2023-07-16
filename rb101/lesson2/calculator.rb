# Calculator with some bonus features

require 'yaml'

MESSAGES = YAML.load_file('calculator_msg.yml')

def prompt(message, personalize = '')
  puts "=> #{MESSAGES[message] + personalize}"
end

def get_valid_name(name)
  loop do
    return name unless name.empty?

    prompt('invalid_name')
    name = gets.chomp
  end
end

def valid_number?(input)
  input.to_f.to_s == input || input.to_i.to_s == input
end

def get_valid_number(number)
  loop do
    return number if valid_number?(number)

    prompt('invalid_num')
    number = gets.chomp
  end
end

def get_valid_operator(operator)
  loop do
    return operator if %w[1 2 3 4].include?(operator)

    prompt('invalid_op')
    operator = gets.chomp
  end
end

def operation_to_message(operator, first_number, second_number)
  operation = case operator
              when '1' then 'Adding'
              when '2' then 'Subtracting'
              when '3' then 'Multiplying'
              when '4' then 'Dividing'
              end

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
  operator == '4' && second_number.to_i.zero?
end

def get_nonzero_number(operator, second_number)
  loop do
    return second_number unless operator == '4' && second_number.to_i.zero?

    prompt('zero_denom')
    second_number = gets.chomp
  end
end

def display_result(result)
  puts "=> The final result is #{result.round(4)}"
end

# Start of main program
prompt('welcome')
prompt('get_name')
name = gets.chomp
name = get_valid_name(name)

prompt('user_name', "#{name}!")

# main loop
loop do
  prompt('first_num')
  first_number = gets.chomp
  first_number = get_valid_number(first_number).to_f

  prompt('second_num')
  second_number = gets.chomp
  second_number = get_valid_number(second_number).to_f

  prompt('operator_prompt')
  operator = gets.chomp
  operator = get_valid_operator(operator)

  second_number = get_nonzero_number(operator, second_number).to_f if zero_division?(operator, second_number)

  operation_to_message(operator, first_number, second_number)
  result = calculate_result(operator, first_number, second_number)
  display_result(result)

  prompt('continue?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('goodbye', "#{name}!")