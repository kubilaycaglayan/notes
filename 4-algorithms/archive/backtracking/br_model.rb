def exact_sum?(k, coins)
  return true if k == 0
  return false if k < 0 || coins.empty?

  exact_sum?(k - coins[0], coins[1, coins.length]) || 
  exact_sum?(k, coins[1, coins.length])
end

p exact_sum?(12, [1, 2, 3, 4, 11])

# => true

p exact_sum?(11, [1, 5, 9, 13])
# puts
# # => false
# 
p exact_sum?(7, [1,2,3,1])
# puts
# # => true
# 
p exact_sum?(7, [4,8,3,4])
# puts
# # => true