def sum_by_index(indexes, coins)
  result = 0;
  indexes.each do |index|
    result += coins[index]
  end
  return result
end

def exact_sum?(k, coins)
  return true if coins.sum == k
  return false if coins.empty?

  result = coins.each_with_index do |coin, index|
    decreased_coins = coins.slice(0,index) + coins.slice(index + 1, coins.length)

    if exact_sum?(k, decreased_coins) == true
      return true 
    end
  end
  return false
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