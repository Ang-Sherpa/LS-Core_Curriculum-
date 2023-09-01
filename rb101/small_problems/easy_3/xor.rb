# In this exercise, you will write a method named xor that takes two arguments, and
# returns true if exactly one of its arguments is truthy, false otherwise.
# Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

def xor?(argument1, argument2)
  return true if argument1 && !argument2
  return true if argument2 && !argument1
  false
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
