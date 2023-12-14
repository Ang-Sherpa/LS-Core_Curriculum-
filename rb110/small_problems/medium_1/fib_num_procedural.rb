=begin

input: nth (integer)
output: fib number at nth (integer)

rules:
- non-recursive method

data strucutre:
  input: integer
  intermediate: array to hold the fib sequence
                grab the last two elements to calculate fib(nth)
  output: integer

notes/qs:
- fib(6) 
  array = [ 1, 1, 2, 3, 5]
        = [fib(1), fib(2), fib(3), fib(4), fib(5)]
  fib(6) = 8 ()
- approach 1 
  - n = 6 
  - array = []
  - iterate (1..(n - 1)) with parameter |num|
      if `num` <= 2 
        add 1 to the array
      else  
        return array[num-2] + array[num - 3]  (bc index starts at 0)

algorithm: 
1. init `fib_array` to []
2. iterate through the range (1.. (n-1)) with the param |num|
  a. if `num` <= 2
   - add 1 to the `fib_array`
  b. otherwise,
   - add the return value of the sum of element at index [num - 2] and
     element at index [num - 3] to `fib_array`
3. return the sum of the last two elements
  ex. fib_array[-1] + fib_array[-2]
=end

def fibonacci(n)
  fib_array = []
  
  (1..(n-1)).each do |num|
    if num <= 2 
      fib_array << 1
    else
      fib_array << (fib_array[(num - 2)] + fib_array[(num - 3)])
    end
  end

  fib_array[-1] + fib_array[-2]
end 

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) => 4202692702.....8285979669707537501