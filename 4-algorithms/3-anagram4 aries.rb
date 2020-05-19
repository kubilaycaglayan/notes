def anagram(s)
  return -1 unless s.length.even?

  letter_count = {}

  ('a'..'z').to_a.each do |letter|
    letter_count[letter] = 0
  end

  s.length.times do |index|
    temp_letter = s[index]
    index < (s.length / 2) ? letter_count[temp_letter] += 1 : letter_count[temp_letter] -= 1
  end

  positives = letter_count.values.select(&:positive?)

  positives.sum
end

strings = %w[aaabbb
             ab
             abc
             mnop
             xyyx
             xaxbbbxx]
results = [3,
           1,
           -1,
           2,
           0,
           1]

strings.each_with_index do |string, index|
  print "#{index + 1}. case : "
  print anagram(string)
  print " FALSE (#{results [index]})" unless anagram(string) == results [index]
  print "\n"
end
