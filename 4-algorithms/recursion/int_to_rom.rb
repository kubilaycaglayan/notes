$roman_mapping = {
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

def integer_to_roman(number, result = '')
  return result if number == 0

  $roman_mapping.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << $roman_mapping[divisor] * quotient
    return integer_to_roman(modulus, result) if quotient > 0
  end
end

p integer_to_roman 1502

