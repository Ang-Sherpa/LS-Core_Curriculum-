=begin
PROBLEM
-input: positive integer
-output: a list of all the divisors of the argument
  - can be in any sequence
  - divisor = divides evenly (w/o remainder) 

EXAMPLES
divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

DATA
-input: integer
-intermediate: integers btw 1 and the input integer
-output: array of integers (divisors)

ALGORITHM
1. init `result` to an empty array
2. iterate from 1 up to the input integer (parameter is `divisor`)
   - IF the remainder of input integer divided by `divisor` is 0
      - add `divisor` to `result` array
3. return `result`
=end

def divisors(number)
  1.upto(number).select do |divisor|
    number % divisor == 0
  end
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute