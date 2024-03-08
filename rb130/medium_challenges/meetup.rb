require 'date'

=begin
PROBLEM
-input: day_of_week, descriptor
-output: date object??? year, month, day
-rules:
  - meetups happen monthly on the same day of the week
  - construct object rep. meetup date
    - w. month (1-12) and year(YYYY)
  - determine the exact date of the meeting in the specified
    month and year
    - ex. 2nd Wed of May 2021 --> 12th, May 2021
  - descriptors = ['first', 'second', 'third', 'fourth', 'fifth', 'last', 'teenth']
  - case of string not important
  - 'teenth' = every month will have one 'teenth' of that day in every month
               every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc
               [13, 14, 15, 16, 17, 18, 19]
  - The fifth day of the month may not happen every month
  - DAYS_OF_WEEK = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday']
  - return nil of the day doesn't exist in the calender year

EXAMPLES
meetup1 = Meetup.new(2013, 3)
meetup.day('Monday', 'first') => #Date.civil(2013, 3, 4)

NOTES
- need #initialize(year, month)
  - do I need to validate these values???
  - initialize a Date object with the year and month given

- need #day(weekday, descriptor)
  - use lowercase version of argumnets??
  - do I need to validate these values???
    - ex. raise ArgumentError unless DAYS_OF_WEEK.include?(weekday)
  - has to return the calender date for the specified description
  - Date#cwday returns the day 1- 7 (monday is 1)
    Date#wday  returns the day 0- 6 (sunday is 0)
  - {1 => 'Monday', 2 => 'Tuesday', 3 => 'Wednesday'...}

- helper methods??
  - given this month; what is the 'first' 'monday'
  - given this month select the dates that are 'mondays'
    using #monday?
    - how do I grab the days in a month
        - iterate for 31 times?
        - use #step (from the start of month to the stard of next month)
            - do not include value from the next month
        - a = Date.new(2024, 2, 1).step(Date.new(2024, 3, 1)).select{|d| d.cwday == 1 && d.month == 2}
              - how does my program know how to call the specific day of the week
                ex. date.friday? or date.monday?
                - argument is given as a string ex. 'Monday'
                - use Date#cwday (1-7)
        - a.map(&:mday)
  - based on the array return value, pick 'first'
  
  - method for figuring out 'teenth'??
  - 'teenth' = every month will have one 'teenth' of that day in every month
               every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc
               TEENTH_DAYS = [13, 14, 15, 16, 17, 18, 19]
      if the descriptor is 'teenth'
        select the dates match the weekday number and the dates that are included
        in TEENTH_DAYS and are in the month

DATA STRUCTURE
# day (without `teeth')
-input: two string objs rep weekday and descriptor
-intermediate:
  - init descriptor to ['first', 'second', 'third', 'fourth', 'fifth', 'last']
  - init DAYS_OF_WEEK to {'Monday' => 1, 'Tuesday' => 2, 'Wednesday' => 3, 'Thursday' => 4
                           'Friday' => 5, 'Saturday => 6, 'Sunday' => 7}
  - step from the 1st of the current month to the 1st of the next month
    and select only days that match the number of the weekday string's value in DAYS_OF_THE_WEEK
    and the current month
-output: Date object that matches the requirements

ALGORITHM
- init descriptor to ['first', 'second', 'third', 'fourth', 'fifth', 'last']
- init DAYS_OF_WEEK to {'Monday' => 1, 'Tuesday' => 2, 'Wednesday' => 3, 'Thursday' => 4
                           'Friday' => 5, 'Saturday => 6, 'Sunday' => 7}

#day
1. step from the 1st of the current month to the 1st of the next month
    and SELECT only days that match the number of the weekday string's value in DAYS_OF_THE_WEEK
    and the current month
2. init day to the element in the resulting array that matches the
    index of the descriptor in descriptor array
3.return a Date object with (year, month, day)
    value of year and month come from initialized instance variable
    value of day comes from the previously init local variable
=end

class Meetup
  attr_reader :year, :month, :start_date, :last_date

  DESCRIPTORS = ['first', 'second', 'third', 'fourth', 'fifth', 'last']
  DAYS_OF_THE_WEEK = { 'monday' => 1,
                       'tuesday' => 2,
                       'wednesday' => 3,
                       'thursday' => 4,
                       'friday' => 5,
                       'saturday' => 6,
                       'sunday' => 7 }

  def initialize(year, month)
    @year = year
    @month = month
    @start_date = Date.new(year, month)
    @last_date = Date.new(year, month, -1)
  end

  def day(weekday, descriptor)
    descriptor = descriptor.downcase
    weekday_number = DAYS_OF_THE_WEEK[weekday.downcase]
    return get_teenth_day(weekday_number) if descriptor == 'teenth'

    candidates = get_days_of_the_same_week(weekday_number)

    index_of_descriptor = if descriptor == 'last'
                            -1
                          else
                            DESCRIPTORS.index(descriptor)
                          end

    candidates[index_of_descriptor]
  end

  def get_days_of_the_same_week(weekday_number)
    start_date.step(last_date).select do |date|
      date.cwday == weekday_number
    end
  end

  def get_teenth_day(weekday_number)
    start_date.step(last_date).select do |date|
      date.cwday == weekday_number && date.mday.between?(13, 19)
    end.first
  end
end
