=begin

# PEDAC
PROBLEM
-input: takes an optional block (implicit block)
-output: depends on the block
  - if block provided: return value of the block
  - if no block: return String 'Does not compute.'

EXAMPLES
compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

ALGORITHM
1. check if a block is given (Kernel#block_given?)
2. if a block is given, yield to the block
3. otherwise return 'Does not compute.'
=end

def compute
  if block_given?
    yield
  else
    'Does not compute.'
  end
end

# Further Exploration

def compute_2(extra=nil)
  if block_given?
    yield(extra)
  else
    'Does not compute.'
  end
end

p (compute_2(2){ |num| 5 + 3 + num }) == 10
p (compute_2('e'){ |char| 'a' + 'b' + char}) == 'abe'
p compute_2 == 'Does not compute.'