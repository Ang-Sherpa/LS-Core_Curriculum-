# Build a program that displays when the user will retire and how many years she has to work till retirement.


puts 'What is your age?'
age = gets.chomp.to_i
puts 'At what age would you like to retire?'
retirement_age = gets.chomp.to_i

current_year = Time.now.year
years_of_work = retirement_age - age
retirement_year = current_year + years_of_work

puts "It's #{current_year}. You will retire in #{retirement_year}." + \
     " You have only #{years_of_work} years of work to go!"
