=begin
time 10:46
NOTE*** I had to look at the solution to understand that I should treat 9 digits
  as their own character even though its technically two characters. That
  means all the PEDAC below did not make it into the final version of `#to_roman`

Problem: take a digit and convert it to a string of its roman numeral 
Examples and test cases: only need to handle values in range 1..3000

Mental model: will need to cycle through the values for each letter
I = 1
V = 5
X = 10
L = 50
C = 100
D = 500
M = 1000

All the numerals are equal to 5 * the value of the preceeding numeral in the heirarchy

numerals which occur insequence sum their values (i.e. II =2; CCC = 300)
numerals that are less than the numeral to their to their right decrement that larger 
  numeral by the 1 or 2 * the value of the smaller numeral (depending on if there are 1 or 2 in sequence)
Any numerals which are smaller than the numeral to their left, increment the value of the 
  left numeral by 1, 2, or 3 * the value of the smaller numeral.

Algorithm:
- set out_numeral = ''
- set current_val to the supplied integer

-while current_val is >= 1
- set quo and remainder to zero
- until quo is equal to or grater than 1
  - divide the current_val by each numeral value starting at the greatest (M).
    - set quo to the quotient and remainder to the remainder
- once you get a quotient equal to 1 or greater you will 
    begin adding numerals to a string
  - #save the current numeral character as current_numeral 
  - if the quotient is 1 and remainder is 4, append out_numeral
      with first the numeral one lower in the hierarchy, then the numeral one higher
      than the current numeral
  - if the quotient is three or less, append out_numeral with the 
      current numeral, quo times.
  - if the quotient is 4 append out_numeral with the current numeral and 
      numeral one higher in the hierarchy
  - quotient should not be greater than 4, print error if so (for testing)
  - set current_val to the remainder
- continue moving through the roman numerals division process from above

# NUMERALS = {
#   'M' => 1000, 'D' => 500, 'C' => 100, 'L' => 50,
#   'X' => 10, 'V' => 5, 'I' => 1
# }
=end

class RomanNumeral
  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
}.freeze

  def initialize(value)
    @value = value
  end

  # def to_roman
  #   out_numeral = ''
  #   current_val = @value
  #   numeral_index = 0
  #   while current_val >= 1 do
  #     quo, remainder = 0, 0
  #     # finding appropriate numeral
  #     loop do
  #       quo, remainder = current_val.divmod(NUMERAL_VALS[numeral_index])
  #       break if quo >= 1

  #       numeral_index += 1
  #     end

  #     # appending out_numeral
  #     if quo == 1 && (remainder >= (remainder % 4))
  #       out_numeral << (NUMERAL_CHARS[numeral_index + 1] + NUMERAL_CHARS[numeral_index - 1])
  #       remainder = 0 if remainder == 4
  #     elsif quo == 4
  #       out_numeral << (NUMERAL_CHARS[numeral_index] + NUMERAL_CHARS[numeral_index - 1])
  #     elsif quo <= 3
  #       out_numeral << (NUMERAL_CHARS[numeral_index] * quo)
  #     else
  #       puts "ERROR"
  #     end

  #     current_val = remainder
  #   end
  #   out_numeral
  # end

  def to_roman
    current_num = @value
    out_str = ''
    ROMAN_NUMERALS.each_pair do |char, val|
      quo = current_num / val
      next unless quo >= 1

      out_str << char * quo
      current_num -= val * quo
    end
    out_str
  end
end

