# input: year (integer)
# output: boolean, whether or not it is a leap year
# requirements:
#     - leap year = year that is divisible by 4 but not by 100 unless evenly divisible by 400
#     - return boolean value
# algorithm
#     - if the year is evenly divisible by 400 then true
#     - if the year is evenly divisible by 100 then false
#     - if the year is evenly divisible by 4 then true 

def leap_year?(year)
  return true if year % 400 == 0
  return false if year % 100 == 0
  year % 4 == 0
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true