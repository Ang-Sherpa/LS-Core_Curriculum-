=begin 
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

    Ruby's Date class may be helpful here.
    Look at how to initialize a Date object
    Look at the friday? method

input: year 
output: returns the number of Friday the 13ths in the year given by an argument

rules:
- returns the number of Friday the 13ths in the year given by an argument (integer)
- can assume that the year is greater than 1752 and it will be the case for the future

data structure:

notes/qs:

- how do get the calendar for the year specified
  - day = 13
  - month = 1
  - Date.new(year)
- how do I get the values for each day so I can iterate and 
  count if the day is friday and 13th of the month 
  - check the 13th of each month (12 values)
  - is it a friday? 
    - if it is add one to the count
  - increase month by 1 
  - stop the loop when month => 12

algorithm:
*** require 'date'
2. init `month` to 1
3. init `friday_13th_count` to 0
4. init `current_date` to a new Date object with `year` (input) , `month`, and `day` 
    ex. Date.new(year, month, day)
5. loop until month is 12 or greater
  - if `current_date` is a friday (use #friday? method)
    - increase `friday_13th_count` by 1
  - increase the `month` by 1
  - reassign current_date to Date.new(year, month, 13)
6. return `friday_13th_count` 
=end 

require 'date'

def friday_13th(year)
  month = 1
  friday_13th_count = 0

  while month <= 12
    current_date = Date.new(year, month, 13)
    friday_13th_count += 1 if current_date.friday?
    month += 1
  end

  friday_13th_count
end 

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

