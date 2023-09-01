# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.

# Modify this program to ask for the input measurements in feet,
# and display the results in square feet, square inches, and square centimeters.

SQ_FT_TO_SQ_IN = 144
SQ_IN_TO_SQ_CM = 6.4516


puts '==> Enter the length of the room in feet:'
length = gets.chomp.to_f

puts '==> Enter the width of the room in feet:'
width = gets.chomp.to_f

square_feet = length * width
square_inches = square_feet * SQ_FT_TO_SQ_IN
square_centimeters = square_inches * SQ_IN_TO_SQ_CM

puts "The area of the room is #{square_feet} square feet" + \
     "/n#{square_inches.round(2)} square inches" + \
     "/n#{square_centimeters.round(2)} square centimeters."
