=begin
PROBLEM
- input: a DNA strand (string of uppercase letters)
- output: return the Hamming distance between two DNA strands
- rules:
  - Hamming distance?
    - couting the number of differences btw two DNA strands taken from
      different genomes with a common ancestor
    - get a measure of the min number of point mutations that
      could have occured btw the two strands
  - The Hamming distance is only defined for sequences of equal length
    - the two DNA strands will be of equal lengths
    - If you have two sequences of unequal length,
      you should compute the Hamming distance over the shorter length

EXAMPLES
same length:
  GAGCCTACTAACGGGAT
  CATCGTAATGACGGCCT
  ^ ^ ^  ^ ^    ^^
  - hamming distance = 7

unequal length
  GAERNTOPKGGGAAAT
  CAPRNTQPKCG
  ^ ^   ^  ^
  - hamming distance = 4

NOTES:
- class DNATest
  - #initialize that takes in a string (DNA)
    - saves the string
  - #hamming_distance the takes in a string (DNA)
    - returns the hamming distance (number of differences)
      between self and the input DNA

DATA STRUCTURE
#hamming_distance
- input: string representing DNA with uppercase letters
- intermediate: turn both strings into array of chars
    - from 0 until the size of the smallest string - 1
      compare the elements at the current index in both arrays
      if the two elements are not equal, add to count
- output: integer representing the hamming distance

ALGORITHM
#initialize
  - save the DNA representation as array of chars
#hamming_distance
  - init count to 0
  - figure out which array is shorter
     - the min value of an array of both array's sizes
  - starting from 0 until the length of the shorter array minus 1
    - compare elements of both array at the current index
      IF the values are different, add one to count
  - return count
=end

class DNA
  attr_reader :dna

  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(other_dna)
    count = 0
    size = [other_dna.size, dna.size].min
    0.upto(size - 1) do |index|
      count += 1 unless dna[index] == other_dna[index]
    end
    count
  end
end

strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
puts DNA.new(strand).hamming_distance(distance)