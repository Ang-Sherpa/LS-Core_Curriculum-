# input: positive or negative integer representation of minute-based time
# output: the time of day in 24 hour format (hh:mm) (string object)
# explicit requirements:
#    - if the number of minutes is positive, the time is after midnight
#      example: (-3) == "23:57"; (-4231) == "01:29"
#    - if the number of minutes is negative, the time is before midnight
#      example: (3000) == "02:00"; (800) == "13:20"
#    - return the time of day in 24 hour format
#    - cannot use ruby's Date and Time classes
#    - disregard other complications involving time
# implicit requirements
#    - 0 is midnight (0:00)
# algorithm
#    - for positive integer and under 1440, get the quotient and the remainder after dividing by 60
#        - quotient is the hour and remainder is the minutes
#    - for positive integer greater than 1440, divide the number by 1440 and get the remainder
#         - divide the remainder by 60 and get the quotient and remainder
#        - quotient is the hour and remainder is the minutes
#    - for negative integer and under 1440, add the negative integer to 1440
#      and then get the quotient and the remainder after dividing by 60
#        - quotient is the hour and remainder is the minutes 
#    - for negative integer and greater than 1440, divide the number by 1440 and get the remainder 
#         - subtract the remainder from 1440 and get the quotient and the remainder after dividing by 60
#    - return the string version of the hour and minutes (hh:mm)

MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = MINUTES_PER_HOUR * 24

def time_of_day(minutes)
  if minutes.positive? && minutes > MINUTES_PER_DAY
    minutes = minutes.remainder(MINUTES_PER_DAY)
  elsif minutes.negative? && minutes < -MINUTES_PER_DAY
    minutes = minutes.remainder(MINUTES_PER_DAY) + MINUTES_PER_DAY
  elsif minutes.negative? && minutes >= -MINUTES_PER_DAY
    minutes = MINUTES_PER_DAY + minutes
  end
  hours, minutes = minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"