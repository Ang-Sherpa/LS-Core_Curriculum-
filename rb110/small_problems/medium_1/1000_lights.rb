=begin

input: total number of switches
output: an array identifies which lights are on after `n` repetitions

rules:
- an array identifies which lights are on after `n` repetitions
ex n = 5
 1: [1, 2, 3, 4, 5] (lights turned on)
 2: [1, 3, 5]
 3: [1, 5]
 4: [1, 4, 5]
 5: [1, 4] return this value

ex. n = 10
1: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
2: [1, 3, 5, 7, 9]
3: [1, 5, 6, 7]
4: [1, 4, 5, 6, 7, 8]
5: [1, 4, 6, 7, 8, 10]
6: [1, 4, 7, 8, 10]
7: [1, 4, 8, 10]
8: [1, 4, 10]
9: [1, 4, 9, 10]
10:[1, 4, 9]

data structure:
-input: integer
-intermediate: an array from 1 to input integer
               an array that holds the "on" values
               an array that holds the "off" values 
-output: an array

notes/ qs:
- multiples of 1-n numbers
- if key % n == 0
- use hash?
  key is the number and value is true or false (true is on, false is off)
1: [1 => true , 2 => true , 3 => true, 4 => true, 5 => true] 
2: [1 => true , 2 => false, 3 => true , 4 => false, 5 => 'true]

algorithm:
1. init `lights_hash` to the array 1 thru n with all values as nil
2. iterate for `n` times with the parameter `round`
   iterate through `lights_hash` tranforming values
    a. if the key of `lights_hash` % (current iteration (`round `+ 1) == 0
      - set the values of lights_hash as opposite of the value it holds
3. return an array with the keys of the hash with values that equal to true
=end

def lights_on_off(n)
  lights_hash = Hash.new
  (1..n).to_a.each { |num| lights_hash[num] = false }

  n.times do |round|
    lights_hash.map do |key, value|
      lights_hash[key] = !value if key % (round + 1) == 0
    end
  end

  lights_hash.keys.select { |key| lights_hash[key] == true }
end


p lights_on_off(5) #== [1, 4]
p lights_on_off(10) #== [1, 4, 9]
p lights_on_off(1000) #== [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]