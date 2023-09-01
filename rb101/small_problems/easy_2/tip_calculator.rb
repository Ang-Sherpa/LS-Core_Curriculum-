# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate.
# The program must compute the tip and then display both the tip and the total amount of the bill.

puts '==> What is the bill?'
bill_amount = gets.chomp.to_f

puts '==> What is the tip percentage?'
tip_rate = gets.chomp.to_f / 100

tip_amount = format('%.2f', (bill_amount * tip_rate))
total = format('%.2f', (bill_amount + tip_amount.to_f))

puts "The tip is $#{tip_amount}"
puts "The total is $#{total}"
