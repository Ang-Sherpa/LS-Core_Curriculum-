# input: year in integer form
# output: string representation of the century
# requirements: 
#       - returns a new string
#       - new centuries end with 01 (1901 = 20th century but 1900 is 19th century)
#       - ends with st, nd, rd, or th as appropriate for that number.
#       - ends with 1 -> st, 2 -> nd, 3 -> rd, 4-0 -> th
#       - ends with 11-19 -> th,
# algorithm
#       - divide year by 100 
#       - the century is 1 - division return value unless mod year by 100 is 0
#       - then the century is the division return value
#       - transform century to string value
#       - if century ends with 11-19 -> th
#       - elsif ends with 1 append st, 2 -> nd, 3 -> rd, 4-0 -> th
#       - return century 

def century(year)
  century = year / 100
  remainder = year % 100

  century += 1 unless remainder == 0
  string_century = century.to_s

  return string_century << 'th' if [11, 12, 13, 14, 15, 16, 17, 18, 19].include?(century % 100)

  suffix = case century % 10
           when 1 then 'st'
           when 2 then 'nd'
           when 3 then 'rd'
           else
             'th'
           end

  string_century + suffix
end 

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'