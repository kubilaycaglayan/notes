def transpose(string)
  string.size.times do |index|
    p string[index..(index + 1)]
    string[index..(index + 1)] = 'ng' if string[index..(index + 1)] == 'gn'    
  end
  return string
end

puts transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

puts transpose('rignadingdiggn!')
# => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# => nnnnnnnnngggggggg