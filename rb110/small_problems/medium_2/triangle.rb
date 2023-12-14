=begin

input: lengths of 3 sides of a triangle (integer)
output: return a symbol depending on what kind of triangle (invalid if it isn't)

rules:
- types of trianges
    equilateral: All 3 sides are of equal length
    isosceles: 2 sides are of equal length, while the 3rd is different
    scalene: All 3 sides are of different length
- is it a triangle
  - the sum of the lengths of the two shortest sides must
    be greater than the length of the longest side
  - all sides must have lengths greater than 0
  - both conditions have to be met
-  returns a symbol :equilateral, :isosceles, :scalene, or :invalid

data structure:
-input: 3 integers
-intermediate: array of the integer values
-output: 1 symbol

notes/qs:
1. find out if it is a triangle
  - 2 conditions are met
  - if the conditions are not met, return :invalid

2. what type of triangle?
  -equilateral: All 3 sides are of equal length
  -isosceles: 2 sides are of equal length, while the 3rd is different
  -scalene: All 3 sides are of different length

algorithm:
*** is_traingle? method
1. init `triangle_array` to [`side1`, `side2`, `side3`] (input integers)
2. init `longest_side` to max value of `triangle_array`
3. init `shorter_sides` to the selected the elements from `traingle_array` 
   that are not the max value
4. init `sides_are_okay`
    return true if if the sum of the
   `shorter_sides` are not greater than `longest_value`
   otherwise false 
5. if there is a 0 in the `triangle_array` or sides_are_okay is false
    return false otherwise return true 

*** triangle
1. if is_triangle(side1, side_2, side_3)
    a. if the sides are all equal
      - return :equilateral 
    b. if side1 is equal to side2 or side3 == side3 or side1 == side3
      - return :isosceles
    c. otherwise 
      - return :scalene
2. otherwise 
    -return :invalid
=end

def is_triangle?(side1, side2, side3)
  triangle_array = [side1, side2, side3]
  longest_side = triangle_array.max
  short_side1, short_side2 = triangle_array.min(2)

  sides_are_okay = longest_side <= (short_side1 + short_side2) 

  !triangle_array.include?(0) && sides_are_okay
end

def triangle(side1, side2, side3)
  if is_triangle?(side1, side2, side3)
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  else
    :invalid
  end
end 



p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid