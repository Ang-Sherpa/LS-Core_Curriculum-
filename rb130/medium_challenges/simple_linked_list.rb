=begin
PROBLEM
-input:
-output:
-rules:
 - each element in the list contains data
   - and next field --> pointing to the next element in the list
 - used to rep. seq. or push-down stacks (Last In First Out)
 - singly linked list w/ elements 1..10
 - methods needed: reverse, convert to and from array
 - class: Element
  - #datum: returns the element???
  - #tail?: true or false if its the last element?
  - #next = returns the last element in the list

 - class: SimpleLinkedList
  - #size = return size of the list
    - 0 when initialized
  - #push(x) = adds the given argument to the list
    in the form of an Element class obj
  - #peek = returns the last element in the list (element)??
    - nil when list is empty
  - #head = returns the first element in the list
  - #pop = deletes and returns the last element in the list
  - ::from_a = transform into a SimpleLinkedList??
  - ::to_a = transform into an array
  - #resverse = reverse the order of the elements in the list

DATA STRUCTURE
- use array to store the list of elements
- elements as elements (1..10)

ALGORITHM
class Element
- #initialize(elements*)
  - take in a element, save the element as @elements
- #datum
  - return the value referenced by @elements
- #tail?
  - return true if the element is the last in the list???
- # next 
  - return the next element in the list

class SimpleLinkedList
- #initialize: save as an empty array
- #size: return size of the list
- #empty?: returns true if the list is empty
- #push(x): pushes an Element object with the argument x
- #peek: returns the head??? element in the list (the element) ???
- #head: returns the last element in the list
- #pop: returns the last element in the list and deletes it 
- ::from_a([]) 
  - argument = array of list
  - turn it into SimpleLinkedList object
- ::to_a
  - return an array version of the SimpleLinkedList object
-#reverse: reverses the order in which the elements appear in the list


=end

class Element
  attr_accessor :element, :next_element

  def initialize(element, next_element=nil)
    @element = element
    @next_element = next_element
  end

  def datum
    element
  end

  def tail?
    next_element.nil?
  end

  def next
    next_element
  end
end

class SimpleLinkedList
  attr_accessor :list

  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def push(element)
    add_element = Element.new(element, list[0])
    list.insert(0, add_element)
  end

  def peek
    return nil if head.nil?
    head.datum
  end

  def head
    list[0]
  end

  def pop
    list.shift.datum
  end

  def self.from_a(array)
    result = SimpleLinkedList.new
    return result if array.nil?
    array.reverse.each { |element| result.push(element) }
    result
  end

  def to_a
    list.each_with_object([]) do |element, array|
      array << element.datum
    end
  end

  def reverse
    new_list = SimpleLinkedList.new
    current_element = head
    while !current_element.nil?
      new_list.push(current_element.datum)
      current_element = current_element.next
    end
    new_list
  end
end