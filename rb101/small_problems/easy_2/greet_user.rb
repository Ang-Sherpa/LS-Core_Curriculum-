# Write a program that will ask for user's name. The program will then greet the user.
# If the user writes "name!" then the computer yells back to the user.

puts 'What is your name?'
name = gets.chomp.capitalize

if name.end_with?('!')
  name = name.chop
  puts "Hi #{name}! Why are we screaming?".upcase
else
  puts "Hi #{name}!"
end
