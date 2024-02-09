=begin
PROBLEM
-input: 3 arguments: starting, ending, and step value + block
-output: ?? ending?

EXAMPLES
step(1, 10, 3) { |value| puts "value = #{value}" }

ALGORITHM
1. intit `current_value` to the starting value
2. until `current_value` is equal to or greater than ending number is reached
  - add the step value to `current_value` and pass it to the block
3. return ending_value?? 
=end

def step(start_point, end_point, increment)
  current_value = start_point
  while current_value <= end_point
    yield(current_value)
    current_value += increment
  end
  current_value
end

p step(1, 10, 3) { |value| puts "value = #{value}" }