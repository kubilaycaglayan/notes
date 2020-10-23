def leftmost_nodes_sum(array)
  index = 0
  sum = 0
  while index < array.length
    sum += array[index]
    index = 2 * index + 1
  end
  sum
end

puts leftmost_nodes_sum([2, 7, 5, 2, 6, 0, 9])
# => 11