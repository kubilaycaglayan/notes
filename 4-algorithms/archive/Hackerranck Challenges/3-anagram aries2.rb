def create_letters_hash
  letters = Hash.new

  ('a'..'z').to_a.each do |letter|
    letters[letter] = 0
  end

  letters
end

def raise(letter, letters)
  letters[letter] += 1
end

def decrease(letter, letters)
  letters[letter] -= 1
end

def anagram(string)
  return -1 unless string.size.even?

  letters = create_letters_hash

  string.size.times do |index|
    letter = string[index]

    index < (string.size / 2) ? raise(letter, letters) : decrease(letter, letters)
  end

  positives = letters.values.select do |value|
    value.positive?
  end

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
