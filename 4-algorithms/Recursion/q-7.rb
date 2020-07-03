# Use the roman_mapping hash to define a recursive method 
# that converts a Roman numeral to an integer.

roman_mapping = {
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
}

def roman_to_integer(roman_mapping, number, result=0)
  return result if number.empty?
  roman_mapping.keys.each do |roman|
    if number.start_with?(roman)
      result += roman_mapping[roman]
      str = number.slice(roman.size, number.size)
      return roman_to_integer(roman_mapping, str, result)
    end
  end
end

p roman_to_integer(roman_mapping, 'MCDVII')