# input: integer 
# output: sum of all the multiples of 3 or 5 that lie btw 1 and the number
# requirements:
#       - find the multiples of 3 or 5 btw 1 and the number
#       - sum the multiples
#       - return the sum 
# algorithm:
#       - find the multiples of 3 btw 1 and the number
#       - find the multiples of 5 btw 1 and the number
#       - sum both of the mutiples
#       - return the sum

def multisum(number)
  multiples = []
  1.upto(number) do |x|
    multiples << x if x % 3 == 0 || x % 5 == 0
  end 
  multiples.sum
end 


p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168