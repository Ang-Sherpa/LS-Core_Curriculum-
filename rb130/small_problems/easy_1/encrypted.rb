=begin
PROBELM
-input: 
-output:

EXAMPLES
Nqn Ybirynpr -> Ada Lovelace
Tenpr Ubccre -> Grace Hopper

DATA
-input: encrypted string
-intermediate: use hash to decipher the input
-output: deciphered string

ALGORITHM
i. init `ENCRYPTION_KEY` hash with the code
1. init `result` to a new String object
2. iterate through each character in the string 
  - if the current char is a space, add space to `result`
  - use the current char as key to the hash and add the 
    value to `result`
3. return `result`

=end

# A_TO_M_DOWNCASE_KEY = Array('a'..'m').zip(Array('n'..'z')).to_h
# N_TO_Z_DOWNCASE_KEY = Array('n'..'z').zip(Array('a'..'m')).to_h
# A_TO_M_UPCASE_KEY = Array('A'..'M').zip(Array('N'..'Z')).to_h
# N_TO_Z_UPCASE_KEY = Array('N'..'Z').zip(Array('A'..'M')).to_h
# FULL_KEY = A_TO_M_DOWNCASE_KEY.merge(N_TO_Z_DOWNCASE_KEY, A_TO_M_UPCASE_KEY, N_TO_Z_UPCASE_KEY)


# def decipher(string)
#   result = String.new
#   string.chars do |char|
#     case char
#     when ' ' then result << char
#     else 
#       result << FULL_KEY[char]
#     end
#   end
#   result
# end

# p decipher('Nqn Ybirynpr')
# p decipher('Tenpr Ubccre')
# p decipher('Nqryr Tbyqfgvar')
# p decipher('Nyna Ghevat')
# p decipher('Puneyrf Onoontr')

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end 

ENCRYPTED_PIONEERS.each do |name|
  puts rot13(name)
end