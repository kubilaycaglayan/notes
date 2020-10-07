$roman_mapping = {
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

def rom_to_int(string, result = 0)
  return result if string.empty?

  $roman_mapping.keys.each do |roman|
    if string.start_with?(roman)
      result += $roman_mapping[roman]
      string.slice!(0, roman.length)
      return rom_to_int(string, result)
    end
  end
end

p rom_to_int('CLII')