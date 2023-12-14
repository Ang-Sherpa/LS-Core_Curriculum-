# Write two methods that each take a time of day in 24 hour format, and return the number of 
# minutes before and after midnight, respectively. Both methods should return a value in 
# the range 0..1439.

# input: time of day in 24 hour format
# output: number of minutes before and after midnight (respectively)
#         value in the range 0..1439
# explicit requirements: 
#     - write two methods
#     - return number of minutes before and after midnight (respectively)
#     - return value in the range 0..1439
# implicit requirements:
#     - '24:00' before or after midnight is 0
#     - '00:00' before or after midnight is 0
# algorithm: 
#     - after_midnight method
#         - grab the first two characters from the string object and assign it to a variable (hours)
#         - grab the last two characters from the string object and assign it to a variable (minutes)
#         - total minutes passed after midnight is hours * 60 (minutes_per_hour) + minutes
#         - return the return value of the expression
#         - edge case
#             - after_midnight('24:00') == 0 
#             - 24 * 60 + 0 = 1440
#         - if the return value is 1440, return 0  
#     - before_midnight method
#         - get the total minutes passed after midnight by invoking the method above
#         - total minutes passed since midnight is 1440 (total minutes in a day) - total minutes passed after midnight
#         - return the return value of the expression
#         - edge case
#             - before_midnight('00:00') == 0    # 
#             - after_mignight('00:00') = 0 * 60 + 0 = 0
#             - 1440 - 0 = 1440
#         - if the return value is 1440, return 0  

MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = MINUTES_PER_HOUR * 24

def after_midnight(string_time)
  hours = string_time[0, 2].to_i
  minutes = string_time[3, 2].to_i
  ((hours * MINUTES_PER_HOUR) + minutes) % MINUTES_PER_DAY
end

def before_midnight(string_time)
  total_minutes_after_midnight = after_midnight(string_time)
  return 0 if total_minutes_after_midnight == 0
  MINUTES_PER_DAY - total_minutes_after_midnight
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0    # 1440 - 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0     # 1440 + 0
p before_midnight('24:00') == 0
