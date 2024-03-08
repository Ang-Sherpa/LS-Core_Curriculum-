=begin
PROBLEM
-input: natural number and set of one or more other nums
-output: sum of all the multiples of the number in the set
  that are less than the first number
-rules:
  - if a set is not given, use a default set of 3 and 5

EXAMPLES
  - input: 20 (either 3 or 5)
  - 3, 5, 6, 9, 10, 12, 15, 18
  - sum = 78

  - input: 10
  - 3, 5, 6, 9
  - 23

  -input: 20 with (7, 13, 17)
  - 7, 13, 14, 17
  - 51

NOTES:
- class method: ::to (doesn't take in any extra numbers)
- instance method: #to 
                   #initialize (takes in extra numbers)
                   #multiples (finds multiples that are less than
                   the target number)

DATA STRUCTURE
#multiples(number)
-input: number
-intermediate:
  - iterate fom 1 up to the target number
    - multiply the number by the current index
    - if the result is less than the target number add the result to the array
    - if any of the result exceeded the target number, break from the loop
-output: array of multiples less than the target number

#to
-input: target number
-intermediate:
  - pass in the set of numbers (default is 3 and 5)
  - use #multiples to get the multiples and sum them
-output: sum of appropriate multiples

::to
-input: targer number
-intermediate: use #multiples to get the multiples and sum them
-output: sum of appropriate multiples

ALGORITHM
#multiples(factor)
1. init `multiples` to []
2. iterate from 1 up to the `target_num`
   - multiply the `factor` by the current number
   - if the result is less than the target number
      and the number isn't already in the array, add to `multiples`
   - if the result is greater than the target number, break the loop
3. return `multiples`

#to
1. init `all_multiples` to []
2. for each number passed in that is not target number
   - use #multiples to add them to `all_multiples`
3. flatten `all_multiples` and sum the elements

::to
1. init `all_multiples` to []
2. for 3 and 5
   - use #multiples to add them to `all_multiples`
3. flatten `all_multiples` and sum the elements
=end

class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = *factors
  end

  def to(target_num)
    all_multiples = []
    factors.each do |factor|
      all_multiples << multiples(target_num, factor)
    end
    all_multiples.flatten.uniq.sum

    # factors.each_with_object([]) { |factor, all_multiples| all_multiples << multiples(target_num, factor) }
  end

  def self.to(target_num)
    SumOfMultiples.new(3, 5).to(target_num)
  end

  private

  def multiples(target_num, factor)
    multiples = []

    1.upto(target_num) do |current_num|
      result = factor * current_num
      if result < target_num && !multiples.include?(result)
        multiples << result
      else
        break
      end
    end
    multiples
  end
end
