=begin    

input: `nth` (integer)
output: compute the p fibonacci number at `nth`

rules:
- p Fibonacci series is a sequence of numbers starting with 1 
  and 1 where each number is the sum of the two previous 
  numbers: ex. 1, 1, 1 + 1 (2), 1 + 2 (3)
- F(1) = 1 ; F(2) = 1 ; F(3) = 2
- F(n) = F(n - 1) + F(n - 2) where n > 2
- A recursive method is one in which the method calls itself. 
    They call themselves at least once.
    They have a condition that stops the recursion (n == 1 above).
    They use the result returned by themselves.
- compute the p fibonacci number at `nth`

data structure:
- input: integer
- intermediate:
  ex. fib(5) --> fib(n - 1) + fib (n - 2)
- output: integer

notes/ qs:
- F(n) = F(n - 1) + F(n - 2) where n > 2
- if n is <= 2 return 1 

algorithm:
1. return 1 if n <= 2
2. add p fibonacci(n - 1) + p fibonacci(n -2)

fib(3) -> fib(2) + fib(1)
            1    +  1  = 2
fib(5) -> fib(4) + fib(3)
        fib(3) + fib(2) + fib(2) + fib(1)
    fib(2) + fib(1) + 1 + 1 + 1
    1 + 1 + 1 + 1 + 1 = 5
=end

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) #== 144
p fibonacci(20) #== 6765