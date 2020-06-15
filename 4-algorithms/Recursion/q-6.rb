# Use the roman_mapping hash to define a recursive method 
# that converts an integer to a Roman numeral.

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def integer_to_roman(roman_mapping, number, result='')
  puts "NUMBER: #{number}"
  return result if number == 0
  roman_mapping.keys.each do |divider|
    quotient, remainder = number.divmod(divider)
    puts "   QUOTIENT: #{quotient}, REMAINDER: #{remainder}, DIVIDER: #{divider}"
    result << roman_mapping[divider] * quotient
    return integer_to_roman(roman_mapping, remainder, result) if quotient > 0
  end
end

p integer_to_roman(roman_mapping, 207)
