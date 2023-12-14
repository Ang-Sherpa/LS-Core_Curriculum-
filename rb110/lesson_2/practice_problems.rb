# Practice Problem 1
# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

arr.sort do |a, b|
  b.to_i <=> a.to_i
end 

# Practice Problem 2

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort do |book1, book2|
  book1[:published].to_i <=> book2[:published].to_i
end

# Practice Problem 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].key(0)

# Practice Problem 4

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4 

# Practice Problem 5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age_males = 0

munsters.each do |_, hash|
  total_age_males += hash["age"] if hash["gender"] == "male"
end

# Practice Problem 6

# (Name) is a (age)-year-old (male or female).

munsters.each do |name, hash| 
  puts "#{name} is a #{hash["age"]}-year-old #{hash["gender"]}."
end 

# Practice Problem 7

a = 2
b = [5, 8]
arr = [a, b] # [2, [5, 8]]

arr[0] += 2  # [4, [5, 8]]
arr[1][0] -= a  #[4, [3, 8]]

# a = 2 // b = [3, 8]

# Practice Problem 8

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |array|
  array.each do |word|
    word.each_char do |letter|
      puts letter if %w[a e i o u].include?(letter)
    end
  end 
end 


# Practice Problem 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_array|
  sub_array.sort do |element1, element2|
    element2 <=> element1
  end 
end 

# Practice Problem 10 

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  hash.each_key do |key|
    hash[key] += 1
  end
end 

# Practice Problem 11 

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

arr.map do |sub_array|
  sub_array.select do |element|
    element % 3 == 0
  end 
end 

# Practice Problem 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

arr.each_with_object({}) do |sub_array, hash|
  hash[sub_array[0]] = [sub_array[1]]
end

# Practice Problem 13

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr.map do |sub_array|
  sub_array.sort do |element1, element2|
    if element1.odd? && element2.odd?
      element1 <=> element2
    end 
  end
end 
    


# Practice Problem 14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, details|
  if details[:type] == 'fruit'
    details[:colors].each do |color|
      color.capitalize
    end
  else
    details[:size].upcase
  end
end

# Practice Problem 15

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |_, sub_array|
    sub_array.all? do |num|
      num.even?
    end
  end 
end 

# Practice Problem 16

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 
# 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

# input = none
# output = 32 hexadecimal characters, broken into 5 section
# explicit requirements
#     - return a new string that is 32 characters 
#     - each secction is denoted by a hyphen but not counted towards the total
# algorithm
#     - randomly generate numbers or letters and add it to the string until total = 32
#     - then split the string into an array
#     - join each section together with (-)
#     - return a new string

def uuid 
  uuid_string = ''
  letters_and_numbers = (A..Z).to_a + (a..z).to_a + (0..9.to_a)
  unless uuid_string.size == 32
    uuid_string << letters_and_numbers.sample
  end
end 



p uuid 
