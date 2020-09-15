def exact_sum?(sum, array)
  p "#{array}  " unless array.empty?
  return true if sum == 0
  return false if sum < 0 || array.empty?

  exact_sum?(sum - array[0], array[1..-1]) || exact_sum?(sum, array[1..-1])
end

puts exact_sum?(122, [1, 2, 3, 4, 5])
# => true
=begin
p exact_sum?(11, [1, 5, 9, 13])
# => false

p exact_sum?(51, [8, 12, 15, 7, 11, 14])
# => false

p exact_sum?(42, [3, 16, 11, 5, 11, 5])
# => false
=end