=begin

input: 3 angles of a triangle
output: return a symbol :right, :acute, :obtuse, or :invalid

rules:
angles of triangles
  - right: One angle of the triangle is a right angle (90 degrees)
  - acute: All 3 angles of the triangle are less than 90 degrees
  - obtuse: One angle is greater than 90 degrees.
valid triangle
  -sum of the angles must be exactly 180 degrees
  -all angles must be greater than 0
  - both conditions must be true
-  returns a symbol :right, :acute, :obtuse, or :invalid 
   depending on whether the triangle is a right, acute, obtuse, or invalid triangle
- all inputs are integers specified in degrees 

data structure:
-input
  - 3 integers
-intermediate
  - arrays of angles
-output
  - 1 symbol

notes/qs: 

algorithm:
1. init `angles` to all the angles given
2. if the sum of all the angles in `angles` is not 180
    or one of the angles is 0 
  a. return :invalid
3. if the `angles` array contains 90 
  a. return :right
  if the `angles` array contains angle > 90
  a. return :obtuse
  otherwise 
  a. retun :acute
=end  

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  return :invalid if angles.reduce(:+) != 180 || angles.include?(0)

  if angles.include?(90)
    :right
  elsif angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end 

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid