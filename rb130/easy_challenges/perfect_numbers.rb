=begin
PROBLEM
-input: positive number
-output: whether the input num is abundant, perfect, or deficient
-rules:
  - positive divisor = num that can be evenly divided
  into the target number w/o remainder, except for the num itself
  - categories = abundant, perfect, deficient
    - aliquot sum = the sum of the positive divisors
  - perfect numbers have an AS equal to the original num
  - abundant numbers have an AS greater than the orig num
  - deficient number have an AS less than the orig num
  - what do we do about floats as input?

EXAMPLES
- 6 is a perfect num
  1, 2, 3 --> 1 + 2 + 3 = 6
- 15 is a deficient num
  1 + 3 + 5 = 9
- 24 is an abundant num
  1 + 2 + 3 + 4 + 6 + 8 + 12 = 36
- prime numbers are always deficient bc their only
  divisor is 1

DATA STRUCTURE
#initialize
- none needed

::classify (class method)
-input: positive integer
  - raise StandardError if negative integer is passed in
-intermediate:
  - find the positive divisors of the number (separate method?)
  - add the divsors and compare the sum to the original number
-output: string rep whether the input num is
         abundant, perfect, or deficient

# divisors
- input: positive integer
- intermediate:
    - init an empty array to store the divisors
    - iterate for the value of integer times
        if the current element evenly divides into the integer
          add the element to the array
- output: array of divisors of the integer

ALGORITHM
# find_divisors
1. init `divisors` to []
2. iterate for the input integer times
   - if the current element evenly divides into the integer
      - add the element to the array
3. return divisors

::classify
1. init `divisors` to return value of calling find_divisors
2. init `sum` to the sum of all the elements in divisors
3. IF the sum > original num
    return 'abundant'
   IF the sum < original num
    return 'deficient'
   ELSE
    return 'perfect'
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError if number.negative?

    sum = sum_of_factors(number)

    if sum > number
      'abundant'
    elsif sum < number
      'deficient'
    else 
      'perfect'
    end
  end

  def self.sum_of_factors(num)
    1.upto(num - 1).select do |possible_divisor|
      num % possible_divisor == 0
    end.sum
  end
end
