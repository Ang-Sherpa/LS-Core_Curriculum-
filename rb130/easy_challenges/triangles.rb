=begin
Problem
	-input: triangle (array of numbers?)
  -output: whether it is an equilateral, isoceles, or scalene? 
	-rules:
		- is it a triangle?
			- length of all sides is greater than 0
			- sum of the lengths of any two sides must be greater than the length
				of the third side
		- is it an equilateral?
			- all three sides the same length
		- is it an isosceles?
			- exactly two sides of the same length
		- is it a scalene?
			- all sides have differenct lengths

Examples
	- triangle(9, 3, 1)
	- triangle(0, 0, 0)
	- triangle(3, 3, 3)
  - triangle(3, 4, 5)
  - triangle(10, 10, 2)
  - see other test cases

Notes:
- Triangle class with following methods
  - constructor method accepts three side lengths
    - raises Argument Error if:
      - length of any side is less than equal to 0
      - if the sum of the lengths of any two sides is less than the length
        of the third side
  - kind (returns what kind of triangle as string)
    - equilateral?
    - isosceles?
    - scalene?

Data Structures
-Triangle#initialize
  - input: three floats or integers
    - rules: raise an Argument Error if:
      - length of any side is less than or equal to 0
      - if the sum of the lengths of any two sides is less than
        the length of the third side
  - output: creation of a Triangle object
-Triangle#kind
  - input: calling object
  - output: string indicating what kind of triangle the 
            calling object is
      can use helper methods to determine the kind of triangle
- Triangle#equilateral?
  - input: sides (floats or integer)
  - output: true or false whether or not it is an equilateral
- Triangle#isosceles?
  - input: sides (floats or integers)
  - output: true or false whether or not it is isosceles
-Triangle#scalene?
  - input: sides (floats or integers)
  - output: true or false whether or not it is scalene

Algorithm
Within Triangle class
1. Define Triangle#initialize
  - init @side1, @side2, and @side3 to their corresponding
    values as passed in to the method
  - IF any of the sides are less than 0, raise an ArgumentError
  - IF the sum of the lengths of any two sides is less than
    the length of the third side, raise an ArgumentError
    - ex. IF @side1 + @side2 <= @side3 
2. Define Triangle#kind
  - IF equilateral? 
      return "equilateral"
  - ELSIF scalene?
      return "scalene"
  - ELSIF isoceles?
      return "isoceles"
3. Define Triangle#equilateral?
  - IF all sides are equal, return true
  - ELSE return false
4. Define Triangle#isoceles?
  - IF two sides are equal, return true (check all sides)
  - ELSE return false
5. Define Triangle#scalene?
  - IF no sides are equal, return true (check all sides)
  - ELSE return false

=end

class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]

    raise ArgumentError unless valid?
  end

  def kind
    if sides.uniq.count == 1
      "equilateral"
    elsif sides.uniq.count == 2
      "isosceles"
    else
      "scalene"
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end
