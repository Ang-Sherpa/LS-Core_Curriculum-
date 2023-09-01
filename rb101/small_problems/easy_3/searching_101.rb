# Write a program that solicits 6 numbers from the user, then prints a message 
# that describes whether or not the 6th number appears amongst the first 5 numbers.

array = []

puts '==> Enter the 1st number:'
array << gets.chomp.to_i

puts '==> Enter the 2nd number:'
array << gets.chomp.to_i

puts '==> Enter the 3rd number:'
array << gets.chomp.to_i

puts '==> Enter the 4th number:'
array << gets.chomp.to_i

puts '==> Enter the 5th number:'
array << gets.chomp.to_i

puts '==> Enter the last number:'
find_num = gets.chomp.to_i

if array.include?(find_num)
  puts "The number #{find_num} appears in #{array}."
else
  puts "The number #{find_num} doesn't appear in #{array}."
end
