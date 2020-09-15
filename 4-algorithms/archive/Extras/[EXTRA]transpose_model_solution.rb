def transpose(string)
  # your code here
  while string.include?('gn')
		string.gsub!('gn', 'ng')
	end
	
	string
end

puts transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

puts transpose('rignadingdiggn!')
# => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# => nnnnnnnnngggggggg

