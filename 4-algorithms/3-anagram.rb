def anagram(string)
  return -1 unless string.size.even?
  p left = string[0...(string.size/2)]
  p right = string[(string.size/2)..(string.size - 1)]
  left_letters = []
  right_letters = []
  left.size.times do |index|
    left_letters << left[index]
  end
  right.size.times do |index|
    right_letters << right[index]
  end
  p left_letters
  p right_letters
  p left_letters - right_letters
  puts "old solution: #{(left_letters - right_letters).size}"
  index_letters = create_index_hash
  string.size.times do |index|
    index < string.size / 2 ? index_letters[string[index]] += 1 : index_letters[string[index]] -= 1
  end
  p index_letters.values
  p index_letters.values.sum
  neg = index_letters.values.select { |value| value.positive? }.sum.abs
  neg
end

def create_index_hash
  occurance = {}
  ('a'..'z').to_a.each do |letter|
    occurance[letter] = 0
  end
  occurance
end

strings = ['aaabbb',
'ab',
'abc',
'mnop',
'xyyx',
'xaxbbbxx',
'asdfjoieufoa',
'fdhlvosfpafhalll',
'mvdalvkiopaufl']

results = [3,
  1,
  -1,
  2,
  0,
  1,3,5,5]

strings.each_with_index do |string, index|
  blank = " " * (20 - string.size)
  puts blank + "#{string} : #{anagram(string) == results[index]} (#{results[index]})"
end