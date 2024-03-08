=begin
PROBLEM
-input: given a robot w.o a name
-output: generate a random, unique name w/o matching w.
         existing robot names
-rules:
  - names such as 'RX837' or 'BC811'
  - names should have two capital letters and 3 numbers
    - NAME_REGEXP = /^[A-Z]{2}\d{3}$/
  - resetting a robot means its name is wiped out
    - next time you ask, will respond with a new random name
  - names must be random, no predictable patterns
  - do not allow the use of same name twice ***

NOTES:
- init class variable @@names_list to []
  - stores the names created so far?
  - delete the specific name when the robot gets rebooted?
  - check for repeating names against this collection
- #name doesn't have to generate a new name each time esp
  if trying to access the name of an already existing robot
- #reset deletes the name

DATA STRUCTURE
#name
- returns a name if @name isn't nil
- genrate_name if @name is nil

#generate_name
-input: nothing
-intermediate:
    - randomly generate letters from [A-Z] two times
      - (64 + rand(1..26)).chr
    - randomly generate numbers from [0-9] three times
        -rand(0..9)
    - check that this new name doesn't match with any names
      on the @@names_list
    - if it does, randomize again until you get a value that
      doesn't match
-output: randomly generated unique string name

ALGORITHM
#generate_name
2. until the `name` is not nil or included in @@names_list
  -2 times add a randomly generated letter from [A-Z] to `name`
  -3 times add a randomly generated number from [0..9] to `name`
    - making sure the number is transformed into string
4. add `name` to @@names_list
5. return `name`

#reset
1. delete `name` from @names_list
2. set `name` to nil
=end

class Robot
  attr_reader :unique_name

  @@names_list = []
  
  def initialize 
    @unique_name = nil
  end 

  def name 
    return unique_name if unique_name
  
    while @@names_list.include?(unique_name) || unique_name.nil?
      @unique_name = generate_name
    end
    @@names_list << unique_name
    unique_name

  end 

  def generate_name
    result = ''
    2.times { result << rand(65..90).chr }
    3.times { result << rand(0..9).to_s }
    result
  end

  def reset
    @@names_list.delete(name)
    @unique_name = nil
  end
end

