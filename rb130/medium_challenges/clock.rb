=begin
PROBLEM
-input: depends on the method but mostly integers
-output: represent clock time independent of date
  - military time 0-24
-rules:
  - two clock objects w. the same time are equal to each other
  - can only use arithmetic operations
  - be able to add and subtract minutes for the time rep. by 
    the given object
  - assuming the inputs are all valid?? 
    ex. minutes or hours beyond [0-24] or [0-60]
    ex. non-integers

EXAMPLES
- Clock.at(10) + 3061
  3061 / 60 = 51 (hours) remainder 1 minute
  51 / 24 = 2 (days) remainder 3 (hours)
  just need the remainders

NOTES:
- class method ::at(hour, minutes=0)
  - takes in one or two integers, first reps hours, second minutes
- instance method #== comparison
- instance method #+ and #- to subtract and add minutes
- instance method #to_s 
  - formats time as '11:09' 
  - format('%02d:%02d', hours, minutes)
- MINUTES_IN_AN_HOUR = 60 
- HOURS_IN_A_DAY = 24

DATA STRUCTURE
#initialize
- @time = nil
- make a reader 

::at(hour, minute=0)
-input: integers rep. hour and minutes respectively
-intermediate:
  - reassign @time to an array with [hour, minute]
-output: clock at a specific hour and minute

#to_s
-intermediate:
  -format('%02d:%02d', hours, minutes)
- output: time in this format '11:09' 

#==(other)
-input: another Clock object
-intermediate
  - compare the @time of self to other.time
-output: boolean

#+(minutes)
-input:integer rep. minutes
-intermediate:
   case add_minutes
    when add_minutes < 60
      minutes += add_minutes
      if minutes > 60   
        @minutes = minutes % 60
        @hours += 1
    when add_minutes == 60 then hour += 1
    else
      hours, mins = minutes.divmod(MINUTES_IN_AN_HOUR)
      hours += hours % HOURS_IN_A_DAY
      minutes += mins
    end
    wrap_around_time
-output: clock object w. updated time

#-(minutes)
-input:integer rep. neg_minutes
-intermediate:
 - if the minute is less than 60
    - subract the neg_minute from minutes
 - if the minute is 60
    - subract 1 from hours
 - if the mintue is greater than 60 
    - init hrs, mins to the divisor, remainder of neg_minutes
      divided by MINUTES_IN_AN_HOUR
    - get the remainder of hrs divided by HOURS_IN_A_DAY
      - subtract this result from hour 
    - subtract the mins from minutes

  - call sub_wrap_around_minutes if the minutes is negative   
  - call wrap_aroung_hours if the hours is greater than 24
  - return an array with hours and minutes in that order
-output: clock object w. updated time
=end


class Clock
  attr_accessor :hours, :minutes

  MINUTES_IN_AN_HOUR = 60
  HOURS_IN_A_DAY = 24

  def initialize(hours, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  def +(add_minutes)
    if add_minutes < 60
      self.minutes += add_minutes
    elsif add_minutes == 60
      self.hours += 1
    else
      hour, mins = add_minutes.divmod(MINUTES_IN_AN_HOUR)
      self.hours += hour % HOURS_IN_A_DAY
      self.minutes += mins
    end

    wrap_around_hours if hours > 24 || (hours == 24 && minutes > 0)
    add_wrap_around_minutes(add_minutes) if minutes >= 60  

    Clock.new(hours, minutes)
  end

  def -(sub_minutes)
    if sub_minutes < 60
      self.minutes -= sub_minutes
    elsif sub_minutes == 60
      self.hours -= 1
    else
      hrs, min = sub_minutes.divmod(MINUTES_IN_AN_HOUR)
      self.hours -= (hrs % HOURS_IN_A_DAY)
      self.minutes -= min
    end
      
    sub_wrap_around_minutes if minutes.negative?
    wrap_around_hours if hours.negative?

    Clock.new(hours, minutes)
  end

  def add_wrap_around_minutes(add_minutes)
    self.minutes += (@minutes % 60)
    self.minutes -= add_minutes
    self.hours += 1

    start_minute = minutes

    while minutes >= 60
      self.minutes += (minutes % 60)
      self.minutes -= start_minute
      self.hours += 1 
    end 
  end

  def sub_wrap_around_minutes
    while minutes.negative?
      self.minutes += 60
      self.hours -= 1
    end
  end

  def wrap_around_hours
    @hours = hours % HOURS_IN_A_DAY
  end
end
