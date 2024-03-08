=begin
PROBLEM
-input: letter
-output: diamond shape w. the input letter at the widest point
-rules:
  - The first row contains one 'A'.
  - The last row contains one 'A'. 
  - all rows, execpt first and last have exactly two ident. letters
  - diamond is horizontally and vertically symmetric
  - has a square shape w. equal height
  - letters form a diamond shape
  - top half has letters in ascending order
  - lower half in descending orger
  - four corners (cont. spaces) are triangles

EXAMPLES
-input: 'A'
- A

-input: 'B' 
 A
B B
 A

- input: 'C' - 3rd letter
  A         (2 ' ', A)
 B B        (1 ' ', B, 1 ' ', B)  
C   C       (C, 3 ' ', C)
 B B        (1 ' ', B 1 ' ', B)
  A         (2 ' ', A)

- input: 'E' - 5th letter (5 dif. lines)
    A         (4 ' ' then A, 4' ')
   B B        (3 ' ', B, 1 ' ', B, 3 ' ')
  C   C       (2 ' ', C, 3 ' ', C, 2 ' ')
 D     D      (1 ' ', D, 5 ' ', D, 1 ' ')
E       E     (E, 7 ' ', E)
 D     D
  C   C
   B B
    A


NOTES:
- after the widest point, the rest of the diamond
  mirrors the top half before the widest part
- no #initialize 
- #make_diamond() = prints the diamond
- lenght of lines and #of lines in total is n + 2 
- spaces at the beg and end is n - 1 (decrease by 1 each time top half)

- use an array of lines (size is ((letter position * 2) - 1)
  - outside_spaces starts at letter position - 1
    - decrease by 1 until reach 0
  - inside_spaces starts at 0
    - increase until reach letter position + 2
  - letter starts at 'A' at position between the two spaces
    - increment letters until reach the input letter
      then decrease by 1

DATA STRUCTURE
-input: letter (uppercase char string)
-intermediate: 
  - init LETTERS to all the uppercase letters in an array
  - init `result` to []
  - init index_of_input_letter to index of input letter in LETTERS
  - init `outside_spaces` to (index_of_letter) - 1
  - init `inside_spaces` to 0
  - init size_of_array = (`index_of_letter` * 2) - 1

  - iterate from 0 upto size_of_array-1
    - IF number is 1 or size_of_array
      - add "#{' ' * outside_spaces}LETTERS[index]#{' ' * outside_spaces}" to `result`
      - decrease outside_spaces by 1
      - increase inside_spaces by 1
    - ELSIF number <= (size_of_array/2)
      - add "#{' ' * outside_spaces}LETTERS[index]"#{' ' * inside_spaces}"LETTERS[index]#{' ' * outside_spaces}
        to `result`
      - decrease outside_spaces by 1
      - increase inside_spaces by 1
    - ELSIF number > (size_of_array/2)
      - add "#{' ' * outside_spaces}LETTERS[index]"#{' ' * inside_spaces}"LETTERS[index]#{' ' * outside_spaces}
        to `result`
      - increase outside_spaces by 1
      - decrease inside_spaces by 1
  - return `result`
-output: diamond shape w. the input letter at the widest point


ALGORITHM

LETTERS = ('A'..'Z').to_a
1. init `result` to []
2. init `input_letter_index` to index of input letter in LETTERS
3. init `outside_spaces` to `input_letter_index`
4. init `inside_spaces` to 0
5. init `last_index_of_array` = (`input_letter_index` * 2)

6. iterate from 0 upto `last_index_of_array`/ 2 (`index`)
    - IF `index` == 1 
      - add "#{' ' * outside_spaces}LETTERS[index]#{' ' * outside_spaces}" to `result`
      - decrease outside_spaces by 1
      - increase inside_spaces by 1
    - ELSE
      - add "#{' ' * outside_spaces}LETTERS[index]"#{' ' * inside_spaces}"LETTERS[index]#{' ' * outside_spaces}
        to `result`
      - decrease outside_spaces by 1
      - increase inside_spaces by 1
7. add to `result` each line of the reversed 
   version of `result` from index 0 to the size-1
8. return `result`
=end

class Diamond
  LETTERS = ('A'..'Z').to_a

  def self.make_diamond(letter)
    result = ''
    input_letter_index = LETTERS.index(letter)
    outside_spaces = input_letter_index
    inside_spaces = -1

    0.upto(input_letter_index) do |index|
      if index.zero?
        result << "#{' ' * outside_spaces}#{LETTERS[index]}".center(7)
      else  
        result << "#{' ' * outside_spaces}#{LETTERS[index]}#{' ' * inside_spaces}#{LETTERS[index]}".center(7)
      end 
      result << "\n"
      outside_spaces -= 1
      inside_spaces += 2
    end

    result.split("\n").reverse[1..-1].each { |line| result << line + "\n" }
    result
  end
end

puts Diamond.make_diamond('E')