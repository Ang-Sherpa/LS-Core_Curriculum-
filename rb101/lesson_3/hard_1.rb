# Question 1

if false
  greeting = "hello world"
end

greeting

# Ruby doesn't throw an undefined local variable exception because greeting has been initalized
# withing the if expression. The greeting variable points to nil when the if expression does not
# get executed.

# Question 2

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => "hi there"

# The variable informal_greeting is pointing to the same string object in the hash object referenced by
# the greetings variable. The shovel method (<<) mutates the caller, so when we use the method on informal_greeting
# the original string object within the hash referenced by greetings also gets mutated.

# Question 3

# A) one is one    (pass by value)
#    two is two
#    three is three
# B) one is one     (pass by value)
#    two is two
#    three is three
# C) one is two      (pass by reference; gsub! mutates the caller)
#    two is three
#    three is one

# Question 4
# You're not returning a false condition, and you're not handling the case that 
# there are more or fewer than 4 components to the IP address
# (e.g. '4.5.5' or '1.2.3.4.5' should be invalid).'

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
