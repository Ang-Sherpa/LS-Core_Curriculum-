# Write a method that will take a short line of text, and print it within a box.

# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# input: short line of text
# output: input text inside a box

def print_in_box(text)
  horizontal_line = '+--+'
  horizontal_line.insert(2, "#{'-' * text.size}")

  empty_line = '|  |'
  empty_line.insert(2, "#{' ' * text.size}")

  text_line = '|  |'
  text_line.insert(2, text)

  puts horizontal_line
  puts empty_line
  puts text_line
  puts empty_line
  puts horizontal_line
end

puts print_in_box('To boldly go where no one has gone before.')
puts print_in_box('')
