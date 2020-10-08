def exact_sum?(k, coins)
  puts k
  return true if k == 0
  return false if k <= 0 || coins.empty?

  return exact_sum?(k, coins[1..-1]) ||
  exact_sum?(k - coins[0], coins[1..-1])
end
=begin
puts exact_sum?(12, [1, 2, 3, 4, 5])
# => true

puts exact_sum?(11, [1, 5, 9, 13])
# => false
=end

puts exact_sum?(1, [1, 2, 3])
# => false
