=begin    

input: text file
output: print the longest sentence in the files
        based on the # of words

rules:
- Sentences may end with periods (.), exclamation points (!), or question marks (?)
- if the chars are not spaces or sentence-ending chars 
  then treat them as words ex. ('--' counts as a word)
- print the number of words in the longest sentence  

notes/qs:
- what does longest mean? the most # of words
- somehow split the sentences from the larger text
  - ['.', '!', '?'] indicate the end of a sentence
  - what is the starting point? --> 
- option 1: split the text by sentence_ending chars
- opt 2: count the words until end point
         what is a word if I don't split the sentence by spaces
         count the spaces then add one (for the last word)
- how does the program know to move on to the next sentence? 
  - delete the sentence as you count them up? 
    - cannot iterate and destructively modify the original obj 
- sentences = text.split(/\.|\?|!/) 
  splits sentences to arrays 


data structure:
- input: text file
- intermediate steps: array of words
                      string obj that is the current longest sentence
- output: print the longest sentence and the count of words

algorithm:
i. init a constant, `SENT_END_CHARS` to ['.', '!', '?']
** inside longest_sentence method
1. init `longest_sentence` to an empty string
   init `sentences` to text.split(/\.|\?|!/) 
2. init `max_words` to 0
3. iterate each sentence in `sentences`
  a. split the current sentence and count the num of words and if 
     this value is greater than the `max_words`
      reassign `longest_sentence` to the current sentence
4. return `longest_sentence` and `max_words`
=end

SENT_END_CHARS = ['.', '!', '?']

def longest_sentence(text)
  longest_sentence = ''
  max_words = 0
  sentences = text.split(/\.|\?|!/)

  sentences.each do |current_sentence|
    if current_sentence.split.length > max_words
      longest_sentence = current_sentence
      max_words = current_sentence.split.length
    end
  end

  p "The longest sentence is: #{longest_sentence}"
  p "This sentence is #{max_words} long."
end 


longest_sentence("Four score and seven years ago our fathers brought forth
  on this continent a new nation, conceived in liberty, and
  dedicated to the proposition that all men are created
  equal.
  
  Now we are engaged in a great civil war, testing whether
  that nation, or any nation so conceived and so dedicated,
  can long endure. We are met on a great battlefield of that
  war. We have come to dedicate a portion of that field, as
  a final resting place for those who here gave their lives
  that that nation might live. It is altogether fitting and
  proper that we should do this.
  
  But, in a larger sense, we can not dedicate, we can not
  consecrate, we can not hallow this ground. The brave
  men, living and dead, who struggled here, have
  consecrated it, far above our poor power to add or
  detract. The world will little note, nor long remember
  what we say here, but it can never forget what they
  did here. It is for us the living, rather, to be dedicated
  here to the unfinished work which they who fought
  here have thus far so nobly advanced. It is rather for
  us to be here dedicated to the great task remaining
  before us -- that from these honored dead we take
  increased devotion to that cause for which they gave
  the last full measure of devotion -- that we here highly
  resolve that these dead shall not have died in vain
  -- that this nation, under God, shall have a new birth
  of freedom -- and that government of the people, by
  the people, for the people, shall not perish from the
  earth.")