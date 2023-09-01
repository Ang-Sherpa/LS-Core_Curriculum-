# Question 1

# see if 'Spot' is present.

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

ages.include?('Spot')
ages.has_key?('Spot')
ages.key?('Spot')
ages.any?('Spot')

# Question 2

munsters_description = 'The Munsters are creepy in a good way.'

puts munsters_description.swapcase
puts munsters_description.capitalize
puts munsters_description.downcase
puts munsters_description.upcase

# Question 3

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10 }
additional_ages = { 'Marilyn' => 22, 'Spot' => 237 }

ages.merge!(additional_ages)

# Question 4
# See if the name 'Dino' appears in the string below:

advice = 'Few things in life are as important as house training your pet dinosaur.'

advice.include?('Dino')
advice =~ /dino/
advice.match?('Dino')

# Question 5

flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]

# Question 6

flintstones.push('Dino')
flintstones << 'Dino'

# Question 7

flintstones.push('Dino', 'Hoppy') # if argument is an array, then this array will be nested in the caller array
flintstones.concat(w%[Dino Hoppy]) # argument needs to be an array []
flintstones.append(w%[Dino Hoppy]) # same as push

# Question 8

advice = 'Few things in life are as important as house training your pet dinosaur.'

advice.slice!(/Few.*as /) # String#slice doesn't mutate the caller; it creates a new object with the return value

# Question 9

statement = 'The Flintstones Rock!'
statement.count('t')

# Question 10

# Back in the stone age (before CSS) we used spaces to align things on the screen.
# If we had a table of Flintstone family members that was forty characters in width,
# how could we easily center that title above the table with spaces?

title = 'Flintstone Family Members'
title.center(40)
