numbers = [1, 2, 3, ['a']]

selected_numbers = numbers[1..-1]

print numbers
puts
print selected_numbers
puts
puts 'CLONE'
numbers_clone = numbers.clone
numbers[2] = 5
numbers[3][0] = 'b'
print numbers
puts
print numbers_clone
puts
puts 'ONE LEVEL DEEP CLONE'
numbers = [1, 2, 3, ['a']]
numbers_one_level_deep_clone = numbers.clone.map(&:clone)
numbers[2] = 5
numbers[3][0] = 'b'
print numbers
puts
print numbers_one_level_deep_clone
