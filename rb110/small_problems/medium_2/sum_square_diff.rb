=begin

input: integer
output: integer

rules:
- return value is the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers
- square of the sum of the first n positive integers
  ex. if n = 3, then (1 + 2 + 3)**2
- the sum of the squares of the first n positive integers
 ex. if n = 3, then (1**2 + 2**2 + 3**2)
- the return value is the diff between the two

notes/qs:
- init two diff variables to store the two values
- methods: sum, reduce, upto

data structure:
- input: integer
- intermediate: arrays ? 
- output: integer

alogrithm:
2. init `sum_square` to 
  - sum of 1 to `number` (input) to `total` 
  - square `total` (** 2)
3. init `sum` to 0
4. init  `square_sum` = 0
5. square each element from 1 to `number` add to `square_sum`
6. return sum_square - square_sum
=end

def sum_square_difference(number)
  sum = 0
  square_sum = 0

  1.upto(number) do  |el| 
    sum += el
    square_sum += (el**2)
  end

  (sum**2) - square_sum
end 


p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150