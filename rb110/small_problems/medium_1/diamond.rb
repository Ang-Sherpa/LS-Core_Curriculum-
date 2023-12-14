=begin    

input: `n` (an odd integer)
output: display a 4-pointed diamond 

rules:
- display a 4-pointed diamond in an n x n grid 
- `n` is an odd integer 
- assume arg will always be an odd integer
- two isocelese triangles (base of both triangles are `n` long)
  - sides are both (`n`+ 1) / 2 
  - ex diamond(9) --> 5, 5, 9 
  - ex diamond(5) --> 3, 3, 5

data structure:
-input: integer
-ouput: display a diamond with * (puts)

notes/qs:
- top starts with 1 *
- add by 2 until the length is `n` 
- then sub by 2 until the length is 1 
- total of 9 layer of *

algorithm:
1. init  `num_of_stars` to 1 
   init  `num_of_spaces` to 1
   init  `array_diamond` to an empty array
   add `n`(#) of spaces to `array_diamond`
2. init  `half_way_point` to (`n` + 1)/ 2
   init `center` to `n` / 2
3. iterate `n` (input) times 
 a. if `num_of_stars` == 1
    -add `num_of_stars` times '*' to the middle of the `array_diamond` (`center`)
    -increment `num_of_stars` by 1
    -join the `array_diamond` and print the resulting string
 b. if `num_of_stars` < half_way_point
    - add `num_of_stars` times '*' to index left of `center` (center - 1) and to the right (center + 1)
    - increment `num_of_stars` by 1
    - join the `array_diamond` and print the resulting string

 c. if `num_of_stars` >= half_way_point
    - add `num_of_spaces` times ' ' to index left of `center` (center - 1) and to the right (center + 1)
    - increment `num_of_spaces` by 1
    - join the `array_diamond` and print the resulting string

=end

def diamond(n)
  num_of_stars = 0
  num_of_spaces = 0
  array_diamond = []
  n.times.each { |_| array_diamond << ' '}

  half_way_point = (n + 1)/ 2
  center = n / 2

  n.times do |_|
    if num_of_stars.zero?
      array_diamond[center] = '*'
      num_of_stars += 1
      puts array_diamond.join
    elsif num_of_stars < half_way_point
      array_diamond[center - num_of_stars] = '*'
      array_diamond[center + num_of_stars] = '*'
      puts array_diamond.join
      num_of_stars += 1
    elsif num_of_stars >= half_way_point
      array_diamond[num_of_spaces] = ' '
      array_diamond[-(num_of_spaces + 1)] = ' '
      puts array_diamond.join
      num_of_spaces += 1
    end
  end
end

diamond(9)