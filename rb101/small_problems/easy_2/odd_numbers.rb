# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# Solution 1
for num in (1..99) do 
  puts num unless num % 2 == 0
end

# Solution 2
(1..99).each do |num|
  puts num unless num.even?
end

# Solution 3
puts ((1..99).select{ |num| num.odd? })
