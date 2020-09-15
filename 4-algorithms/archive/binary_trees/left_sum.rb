def leftmost_nodes_sum(array)
  next_index = 0
  sum = 0
  while next_index < array.length
    sum += array[next_index]
    next_index = 2 * next_index + 1
  end
  sum
end

puts leftmost_nodes_sum([2, 7, 5, 2, 6, 0, 9])
# => 11