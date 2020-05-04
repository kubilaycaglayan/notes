def anagram(s)
  return -1 unless s.length.even?

  char_occurances = Hash.new

  ("a".."z").to_a.each do |letter|
    char_occurances[letter] = 0
  end
  
  left = s[0..(s.length/2-1)]
  right = s[(s.length/2)..-1]

  s.length.times do |index|
    temp_letter = s[index]
    index < (s.length / 2 - 1) ? char_occurances[temp_letter] += 1 : char_occurances[temp_letter] -= 1
  end

  positives = char_occurances.values.select { |char| char.positive?}

  return positives.sum
end

anagram("kevinn")

strings = ["aaabbb",
  "ab",
  "abc",
  "mnop",
  "xyyx",
  "xaxbbbxx"]
results = [3,
  1,
  -1,
  2,
  0,
  1]

strings.each_with_index do |string, index| 
  print "#{index + 1}. case : "
  print anagram(string)
  print " FALSE (#{results [index]})" unless anagram(string) == results    [index]
  print "\n"
end