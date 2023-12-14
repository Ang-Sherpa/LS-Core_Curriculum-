# Example 1

[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

# The nested array [[1, 2], [3, 4]] is calling the #each method. The #each method invocation is
# is followed by a do..end structure which defines a block. Inside the block, arr is initialized 
# as the block parameter. arr represents the array element in the current iteration of the method.
# On line 2, the puts method is invoked an passed the result of the invocation of the #first method 
# by the current element in the array. The #first method returns the first element in a collection
# which is why the first element of each array within the larger array gets printed. Lastly, #each 
# method always returns the original collection. 

# Example 3

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# Line | Action                   | Object           | Side-Effect |	Return Value    | Is Return Value Used?
# -----------------------------------------------------------------------------------------------------------
#  1   |  method call (map)       | [[1, 2], [3, 4]] |  none     | new array [1, 3] | No
# 1-4  |  block execution         | each subarray    |  none     | none             | Yes, by map
# 2    |  method call (first)     | each subarray    |  none     | subarray[0]      | No
# 2    |  method call (puts)      | arr.first        |  output   |  nil             | Yes, by puts
# 3    |  method call (first)     | each subarray    |  none     | subarray[0]      | Yes, by # map 

# This piece of code should return [1, 3] and will not have any side effects. Inside the block following the 
# invocation of #map, the puts method is invoked and passed the return value of arr.first. This will cause the
# first element in the current array within the larger nested array will be printed. On line 3, arr.first is 
# repeated, because this is the last expression in the block, the return value of arr.first is the return value
# of the block. # map uses the return value to determine the transformation of the new collection it returns.

# Example 4

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# Line | Action                |   Object            | Side-Effect|	   Return Value   | Is Return Value Used?
# -----------------------------------------------------------------------------------------------------------
#  1   |  variable assignment  | [[18, 7], [3, 12]]  |   none     | [[18, 7], [3, 12]] | no
#  1   |  method call (each)   | [[18, 7], [3, 12]]  |   none     | [[18, 7], [3, 12]] | yes by my_arr
#  1-7 |  outer block execution| each subarray       |   none     | each subarray      | no
#  2   |  method call (each)   | each subarray       |   none     |    arr             | no
#  4   |  method call (puts)   | ea element          |   output   |   nil              | no

# The output will be 18, 7, and 12. The return value will be [[18, 7], [3, 12]]. On line 1, my_arr is initialized
# to the return value of the invocation of the #each method called by [[18, 7], [3, 12]]. Within the block that 
# follows the each method, another #each method is being called by each subarray of the original nested array followed
# by a block. Within this inner block, there is an if condition that executes if the element within the subarray is 
# greater than 5. So, if the element within the current subarray is greater than 5, the puts method is used to print
# them. Otherwise, nothing gets printed. We know that each method returns the original array and does not use the return
# value of the block, so the return value of the outer #each method invocation will be [[18, 7], [3, 12]].


# Example 5

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# Line | Action                | Object          | Side-Effect|	Return Value      | Is Return Value Used?
# -----------------------------------------------------------------------------------------------------------
#  1   | method call (map)     | [1, 2], [3, 4]  |   none     | [[2, 4],[6, 8]]   | no  
# 1-5  | block execution       | [1, 2], [3, 4]  |   none     | [[2, 4],[6, 8]    | yes by map to determine transformation
# 2    | method call (map)     | each subarray   |   none     | [[2, 4],[6, 8]    | yes by map to determine transformation
# 2-4  | block execution       | each subarray   |   none     | each element * 2  | yes by map to determine transformation
# 3    | method call (*)       | num and 2       |   none     | each element * 2  | yes by map to determine transformation

# Example 10 

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.to_i == el   # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# Line | Action               | Object                   |Side-Effect|	Return Value             | Is Return Value Used?
# -----------------------------------------------------------------------------------------------------------
#  1   | method call (map)    |[[[1, 2], [3, 4]], [5, 6]]|   none    |[[[2, 3], [4, 5]], [6, 7]] | No
# 2-10 | block execution      | each subarray            |   none    |[[[2, 3], [4, 5]], [6, 7]] | Yes, by #map for transformation
# 2    | method call (map)    | each subarray            |   none    |     el + 1 ???            | Yes, by level 1 #map for transformation
# 2    | block execution      | each subarray            |   none    |     el + 1 ???            | Yes, by level 2 #map for transformation
# 6    | method call (map)    | ea element of subarray   |   none    |     n + 1                 | Yes, by level 2 #map for transformation
# 6-9  | block execution      | ea. element of subarray  |   none    |     n + 1                 | Yes, by level 1 #map for transformation











