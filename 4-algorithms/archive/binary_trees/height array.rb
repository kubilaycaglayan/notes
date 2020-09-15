def binary_tree_height(array_tree)
  next_index = 0
  height = 0
  while next_index < array_tree.length
    height += 1
    next_index = 2 * next_index + 1
  end
  height
end

puts binary_tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3