=begin
PROBLEM
-input:
-output: a custom set type
-rules:
  - assume all elements of a set must be numbers
  - set of unique elements
  - methods for CustomSet class
    - #initialize: w/ array or no arguments
    - #empty?: true or false whether set is empty
    - #contains?(element): true or false if the set contains the element
    - #subset?(set): if the argument set has all the elements of the
                    the calling set obj
    - #disjoint?(set): returns false if there are any overlap in elements
                       true if there are no overlaps
    - #eql?(set): if the elements in the sets have the same values
                  order of the elements doesn't matter
                  how many of each element doesn't matter
                  [1, 2, 2, 1] == [2, 1]
    - #add(element): adds the unique element to the set
    - #intersection(set): returns a set with all the shared values
                          returns an empty set if no shared values
    - #difference(set): calling set - argument set
                        [3, 2, 1].differece([2, 4]) = [3, 1]
    - #union(set): returns all the unique values into one set
    - #size: return the size of the set

DATA STRUCTURE
- input: array or none

ALGORITHM
#subset?(other_set)
  - true if the argument set has all the elements of the calling set obj
1. find out which set is larger [1, 2, 3] or [4, 1, 2, 3]
2. iterate through the smaller set unless the smallest set is 0
  - return false if the current element is not inclued in the bigger set
3. return true

#disjoint?(set):
-returns false if there are any overlap in elements
-true if there are no overlaps
  - ex. [1, 2] and [2, 3] == false
  - ex. [1, 2] and [3, 4] == true
  - ex. [1]    and []     == true
  - ex. []     and []     == true
1. return true if either sets are empty
2. combine the two set and count their unique values
   if the uniq value count is equal to the size of set and the other set
   then return true
   otherwise false

#eql?(set): if the elements in the sets have the same values
  #  order of the elements doesn't matter
  #  how many of each element doesn't matter
  #  [1, 2, 2, 1] == [2, 1]
  #  [1, 2, 2, 3] and [2, 1] would did this be equal?
1. match the unique items, sorted in one set with the other
2. if they both are equal then return true otherwise false

#intersection(set): returns a set with all the shared values
                    returns an empty set if no shared values
1. init `result` to a new CustomSet object
2. if either the calling obj's set or the arg's set is empty return `result`
3. if the calling obj's set is smaller than the arg's set
     iterate through the calling obj's set
       if the arg set contains the current element
        add the current element to `result` (using #add)
4. else
     iterate through the arg's sey
       if the calling obj's set includes the current element
        add the current element to `result` (using #add)
4. return `result`

#difference(set): return the items in self not found in the arg.
 ex. [3, 2, 1].differece([2, 4]) = [3, 1]
 ex. [1, 2, 3, 4].difference([]) = [1, 2, 3, 4]
 ex. [].difference([3, 2, 5]) = []
1. init `result` to new CustomSet object
2. if self is empty, return `result`
3. iterate through the self's set
     if the current element is not included in the arg set
      add the current element to `result`
4. return result

#union(set): returns all the unique values into one set
 ex. [1, 3] and []     -> [1, 3]
 ex. [1, 3] and [2, 3] -> [1, 2, 3]
1. init `result` to a new CustomSet obj
2. init `both_sets` to the sets of both self and other set
3. iterate through the sorted uniq values of `both_sets`
      add the current element to `result`
4. return `result`
=end

class CustomSet
  attr_reader :set

  def initialize(elements = [])
    @set = elements
  end

  def empty?
    set.empty?
  end

  def contains?(element)
    set.include?(element)
  end

  def size
    set.size
  end

  def subset?(other)
    if size <= other.size || other.empty?
      set.each { |element| return false unless other.contains?(element) }
    else
      other.set.each { |element| return false unless contains?(element) }
    end
    true
  end

  def disjoint?(other)
    set.none? { |element| other.contains?(element) }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def ==(other)
    set == other.set
  end

  def add(element)
    set.push(element) unless contains?(element)
    self
  end

  def intersection(other)
    same_elements = set.select { |element| other.contains?(element) }
    CustomSet.new(same_elements)
  end

  def difference(other)
    result = set.select { |element| !other.contains?(element) }
    CustomSet.new(result)
  end

  def union(other)
    result = CustomSet.new
    both_sets = set + other.set
    both_sets.sort.uniq.each { |element| result.add(element) }
    result
  end
end

