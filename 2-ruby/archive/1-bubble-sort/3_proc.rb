triple_strings = proc do |string|
  string * 3
end
tripled = %w[A B C].collect(&triple_strings)
print tripled
puts

numbers = (0..5).to_a
print numbers
puts
numbers_as_strings = numbers.collect(&:to_s)
print numbers_as_strings
