# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the compute_sum or compute_product of all numbers
# between 1 and the entered integer.

def valid_number?(input)
  input.to_i.to_s == input && input.to_i.positive?
end

def compute_sum(number)
  total = 0
  1.upto(number) { |num| total += num }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |num| total *= num }
  total
end

puts '>> Please enter an integer greater than 0:'
number = gets.chomp

loop do
  break if valid_number?(number)

  puts 'Please enter a valid integer greater than 0:'
  number = gets.chomp
end

number = number.to_i

puts ">> Enter 's' to compute the compute_sum, 'p' to compute the compute_product."
calculation = gets.chomp

if calculation == 's'
  puts "The compute_sum of the integers between 1 and #{number} is #{compute_sum(number)}"
elsif calculation == 'p'
  puts "The compute_product of the integers between 1 and #{number} is #{compute_product(number)}"
end
