# Complete the solution so that it returns the number of times the search_text 
# is found within the full_text. Overlap is not permitted : "aaa" contains 1 instance of "aa", not 2.

# Usage example:

# full_text = "aa_bb_cc_dd_bb_e", search_text = "bb"
#     ---> should return 2 since "bb" shows up twice


# full_text = "aaabbbcccc", search_text = "bbb"
#     ---> should return 1

=begin

PROBLEM
input: two strings, full_text and search_text
output: number of times the search_text occurs in the full_text
  - no overlaps
  - ex. "aaa" contains 1 instance of "aa", not 2

EXAMPLES
# full_text = "aa_bb_cc_dd_bb_e", search_text = "bb"
#     ---> should return 2 since "bb" shows up twice



# full_text = "aaabbbcccc", search_text = "bbb"
#     ---> should return 1
  - grab a slice of the size of search_text from the full_text
    - 'aaa', 'aab', 'abb' --> check if it matches search_text
    - 'bbb', 'bbc', 'bcc'
    - 'ccc', 'ccc'

# "aaa" contains 1 instance of "aa", not 2
  - 'aa', 'aa' --> should only count as 1 
  - only count as two if 'aa' + 'aa' = full_text

# "aaabaaa'
  - 'aa', 'aa', 'ab', 'ba', 'aa', 'aa'
  - count of 'a' = 6
  - 

DATA
input: two strings
intermediate: array of substrings
output: integer rep. number of times search_text appears in full_text


NOTES


ALGORITHM




=end


# p solution('abcdeb','b') == 2
# p solution('abcdeb', 'a') == 1
# p solution('abbc', 'bb') == 1
