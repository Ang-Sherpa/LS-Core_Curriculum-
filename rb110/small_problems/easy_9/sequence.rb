=begin   

input: an integer
output: array of all integer in seq btw 1 and the arg

rules:
- arg will always be valid integer that is greater than 0
- return an array of all integer in seq btw 1 and the arg
  ex. 5 --> [1, 2, 3, 4, 5]
      1 --> [1]
- returning array --> starts at 1, ends at number (arg)

notes/qs:
- range and then turn the range into an array

data structure: 
- input: integer
- intermediate: array of integers btw 1 and the arg
- output: array

algorithm: 
1. create range btw 1 and the arg and then turn the range into
    an array

test case  = sequence(5)
1. (1..5).to_a --> [1, 2, 3, 4, 5]
=end

def sequence(integer)
  (1..integer).to_a
end 

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]