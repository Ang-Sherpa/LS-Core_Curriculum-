=begin
PROBLEM
-input:
-output: generate the lyrics of the 99 Bottles of Beer song
-rules:
  -see test suite for entire song
  - split into verses 1-99
  - class methods BeerSong::verse(number) and BeerSong::verses(*numbers)
            BeerSong::lyrics = all 99 verses

EXAMPLES
- last verse
  "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
-first verse = (1)
  "1 bottle of beer on the wall, 1 bottle of beer.\n" \
  "Take it down and pass it around, no more bottles of beer on the wall.\n"
-last verse = (99)
  "99 bottles of beer on the wall, 99 bottles of beer.\n" \
  "Take one down and pass it around, 98 bottles of beer on the wall.\n"

DATA STRUCTURE
BeerSong#find_verse(number)
-input: number
-intermediate:
  - if `number` is 2-99, output
  "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
  "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  - elsif `number` is 1 output
  "1 bottle of beer on the wall, 1 bottle of beer.\n" \
  "Take it down and pass it around, no more bottles of beer on the wall.\n"
  -elsif `number` is 0 output
   "No more bottles of beer on the wall, no more bottles of beer.\n" \
   "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
- output: string

BeerSong::verse(number)
-input: number
-intermediate: call #find_verse and pass it number
-output: print the string

BeerSong::verse(*numbers)
-input: array of numbers
-intermediate:
  - init `list_of_verses` to []
  - iterate through the reversed version of array of numbers
    and pass each number to #find_verse and add the string output to
    `list_of_verses`
- output: print the verses

BeerSong::lyrics
-input: none
-intermediate: from 99 to 0 call #verse on each number
-output: print each verse

ALGORITHM
BeerSong::verse(number)
1.IF `number` is 2-99, output
  "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
  "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  ELSIF `number` is 1 output
  "1 bottle of beer on the wall, 1 bottle of beer.\n" \
  "Take it down and pass it around, no more bottles of beer on the wall.\n"
  ELSIF `number` is 0 output
   "No more bottles of beer on the wall, no more bottles of beer.\n" \
   "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  ELSE
  raise ArgumentError

BeerSong::verses(num1 num2)
1. iterate through the reversed version of array of numbers
   and pass each number to #verse and print the string output
   and add newline

BeerSong::lyrics
1. from 99 to 0 call #verse on each number and add a new line in between
=end

class BeerSong
  def self.verse(number)
    case number
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    when 3..99
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    else
      raise ArgumentError
    end
  end

  def self.verses(start, stop)
    list_of_verses = []
    current_verse = start

    while current_verse >= stop
      list_of_verses << BeerSong.verse(current_verse)
      current_verse -= 1
    end

    list_of_verses.join("\n")
  end

  def self.lyrics
    verses(99,0)
  end
end

puts BeerSong.verses(2, 0)
