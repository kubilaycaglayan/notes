def tree_height(tree_as_list)
  index = 0
  stack = []
  node = tree_as_list[index]
  until node.nil?
    stack << 1
    index = 2 * index + 1
    node = tree_as_list[index]
  end
  stack.sum
end

puts tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3

puts tree_height([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# => 4

puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# => 4