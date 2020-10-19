def tree_height(tree_as_list)
  return 0 if tree_as_list.empty? || tree_as_list.first.zero?

  stack = [tree_as_list[0]]
  height = 0
  start = 0
  finish = 0

  until stack.empty? || stack.all?(0)
    stack.clear

    height += 1
    start = start*2 + 1
    finish = finish*2 + 2
    stack.concat tree_as_list[start..finish]
  end

  height
end

puts tree_height([0])
# => 0

puts tree_height([])
# => 0

puts tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3

puts tree_height([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# => 4

puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# => 4

puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0])
# => 3