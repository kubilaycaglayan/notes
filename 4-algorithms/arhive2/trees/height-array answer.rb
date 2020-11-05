def binary_tree_height(array_tree)
  index = 0
  height = 0
  while index < array_tree.size
    index = index * 2 + 1
    height += 1
  end
  return height unless array_tree[((index - 1) / 2)..-1].all?(0)
  return height - 1
end

puts binary_tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3