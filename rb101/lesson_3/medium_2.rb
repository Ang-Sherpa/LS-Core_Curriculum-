# Question 1

a = 'forty two'
b = 'forty two'
c = a

# a an c are pointing to the same object so they will have the same object id
# b is pointing to another object with the same string value 

# Question 2
a = 42
b = 42
c = a

# a, b, c all have the same object id because they are pointing to the same integer
# intergers are immutable, they can only be reassigned

# Question 3

# displays pumpkins in line one and pumpkinsrutabaga in line two
# the method tricky_method takes in two string objects as arguments
# inside the method the arguments are assigned to string_param_one, string_param_two
# the reassignment operator (+=) assigns the variable to a new object
# the shovel opeator (<<) mutates the caller and changes the object it is being called upon
# therefore even though inside the method both arguments have the same value
# outside the method, only string_arg_two has changed its value, nothing has happened to the 
# string_arg_one, the original object has stayed the same

# Question 4

# a string (my_string) and an array (my_array) is passed as an argument to tricky_method_two
# the method initializes local variables for the arguments and assigns references to the local variables
# similar to Question 3, << mutates its object while += assigns the variable to a new object
# therefore outside the method the value of the original string changes but the array does not 
# however inside the method, both local variables reflect changes applied to them

# Question 5

def tricky_method(a_string_param, an_array_param)
  a_string_param += 'rutabaga'
  an_array_param += ['rutabaga']

  return a_string_param, an_array_param
end

my_string = 'pumpkins'
my_array = ['pumpkins']
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 6

def color_valid(color)
  %w[blue green].include?(color)? 
end
