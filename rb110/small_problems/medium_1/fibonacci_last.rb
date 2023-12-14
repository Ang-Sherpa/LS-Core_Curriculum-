=begin     

input: integer (nth)
output: integer (last digit of the nth Fib number)

rules:
- return an integer which is the last digit of the nth fib #
- no recursion

notes/qs:
- can turn fib # into a string and cut the last part
- can I use the previous method?

data structure: 
-input: integer (any num of digits)
-intermediate: turn the fib number into a string to capture only the last value 
-output: integer (one digit)

algorithm:
1. init `fib_number` to the return value of fiboncci(nth)
2. init `fib_string` to the string version of `fib_number`
3. return the integer version of the last char in `fib_string`
=end

def fibonacci(n)
  first, last = [1 , 1]
  3.upto(n) do |_|
    first, last = [last, first + last]
  end

  last
end

def fibonacci_last(nth)
  fib_number = fibonacci(nth)
  fib_string = fib_number.to_s

  fib_string[-1].to_i
end 


# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4