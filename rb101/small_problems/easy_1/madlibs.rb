# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

puts 'Enter a noun:'
noun = gets.chomp
puts 'Enter a verb:'
verb = gets.chomp
puts 'Enter an adverb:'
adverb = gets.chomp
puts 'Enter an adjective:'
adjective = gets.chomp

sentence1 = "The #{adjective} #{noun} #{verb}s #{adverb}."
sentence2 = "Does their #{adjective} #{noun} #{verb} #{adverb}?"
sentence3 = "We often see her #{adjective} #{noun} #{verb}ing #{adverb}"

puts [sentence1, sentence2, sentence3].sample
