# Question 3

advice = 'Few things in life are as important as house training your pet dinosaur.'
advice.gsub!('important', 'urgent')

# Question 5

(10...100).include?(42)

# Question 6
# show two different ways to put the expected 'Four score and ' in front of it.

famous_words = 'seven years ago...'
famous_words.insert(0, 'Four score and ')
famous_words.prepend('Four score and ')

# Question 7

flintstones = ['Fred', 'Wilma', ['Barney', 'Betty'], ['BamBam', 'Pebbles']]

flintstones.flatten!

# Question 8
# Barney's name and Barney's number.

flintstones = { 'Fred' => 0, 'Wilma' => 1, 'Barney' => 2, 'Betty' => 3, 'BamBam' => 4, 'Pebbles' => 5 }

barney = flintstones.assoc('Barney')
