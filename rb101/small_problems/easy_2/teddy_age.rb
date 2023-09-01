# Build a program that randomly generates and prints Teddy's age. 
# To get the age, you should generate a random number between 20 and 200

# Modify this program to ask for a name, and then print the age for that erson. 
# For an extra challenge, use "Teddy" as the name if no name is entered.

puts "What's your name?"
name = gets.chomp.capitalize

name = 'Teddy' if name.empty?

age = rand(20..200)

puts "#{name}'s teddy is #{age} years old."