# Mortgage Calculator

DURATION_LIST = %w[m months month mth y years year yr].freeze
MONTHS = %w[m months month mth].freeze

def prompt(text)
  puts "=> #{text}"
end

def border_lines
  prompt('----------------------------------------------------------------------')
end

def display_welcome
  prompt('Welcome to our Mortgage Calculator!')
  prompt('What is your name?')
end

def get_valid_name(name)
  loop do
    return name unless name.strip.empty?

    prompt('Invalid answer. Please enter again.')
    name = gets.chomp
  end
end

def valid_number?(input)
  /\d/.match?(input) && /^-?\d*\.?\d*$/.match?(input)
end

def get_valid_answer(input)
  loop do
    return input if valid_number?(input) && input.to_f.positive?

    prompt('Invalid number. Please enter a valid positive number.')
    input = gets.chomp
  end
end

def set_valid_loan_amount
  prompt('What is your loan amount?')
  prompt('(Example: $50,000 for 50000)')
  loan_amount = gets.chomp
  get_valid_answer(loan_amount)
end

def set_valid_apr
  prompt('What is your Annual Percentage Rate (APR)?')
  prompt('(Example: 5 or 0.05 for 5%)')
  apr = gets.chomp
  return apr if apr.to_i.zero?

  get_valid_answer(apr)
end

def get_valid_duration(duration_unit)
  loop do
    return duration_unit if DURATION_LIST.include?(duration_unit.downcase)

    prompt('Invalid unit. Please pick either year or month')
    duration_unit = gets.chomp
  end
end

def set_valid_loan_duration
  prompt('What is your loan duration in years or months?')
  prompt('(Example: 5 for 5 years or 60 for 60 months)')
  loan_duration = gets.chomp
  get_valid_answer(loan_duration)
end

def in_months?(duration_unit)
  MONTHS.include?(duration_unit)
end

def convert_duration_to_months(loan_duration, duration_unit)
  if in_months?(duration_unit)
    loan_duration
  else
    (loan_duration * 12)
  end
end

def set_valid_duration_unit
  prompt('Is your loan duration in years or months?')
  duration_unit = gets.chomp
  get_valid_duration(duration_unit)
end

def convert_to_monthly_rate(apr)
  if apr < 1.00
    apr / 12
  else
    (apr / 12) / 100
  end
end

def calculate_monthly_payment(monthly_rate, loan_amount, loan_duration_in_months)
  loan_amount *
    (monthly_rate / 
    (1 - (1 + monthly_rate)**(-loan_duration_in_months)))
end

def display_user_inputs(loan_amount, apr)
  prompt('Information you provided:')
  prompt("Loan amount: $#{loan_amount}")
  prompt("APR: #{apr}")
  border_lines
end

def display_final_results(name, monthly_rate, loan_duration_in_months, monthly_payment)
  prompt("Alright, #{name}!")
  prompt("Your monthly interest rate is #{(monthly_rate * 100).round(3)}%")
  prompt("Your loan duration is #{loan_duration_in_months.round(1)} months")
  prompt("Your monthly payment is $#{monthly_payment.round(2)}")
  border_lines
end

def display_goodbye(name)
  prompt('Thank you for using our Mortgage Calculator!')
  prompt("See you next time, #{name}!")
end

# Main program

display_welcome
name = gets.chomp
name = get_valid_name(name).capitalize

prompt("Hi #{name}!")

# Main loop
loop do
  loan_amount = set_valid_loan_amount.to_f

  apr = set_valid_apr.to_f

  loan_duration = set_valid_loan_duration.to_f

  duration_unit = set_valid_duration_unit

  system('clear')

  loan_duration_in_months = convert_duration_to_months(loan_duration, duration_unit)
  monthly_rate = convert_to_monthly_rate(apr)
  monthly_payment = calculate_monthly_payment(monthly_rate, loan_amount, loan_duration_in_months)

  display_user_inputs(loan_amount, apr)
  display_final_results(name, monthly_rate, loan_duration_in_months, monthly_payment)

  prompt('Would you like to do another mortgage calculation? Type Y/y to continue.')
  answer = gets.chomp.downcase

  break unless answer.start_with?('y')

  system('clear')
end

display_goodbye(name)
