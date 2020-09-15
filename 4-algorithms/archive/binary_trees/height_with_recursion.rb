def how_many_nodes_are_there_on_a_level(level)
  return 0 if level < 1
  number_of_nodes = 0
  level.times do |index|
    number_of_nodes = 2 ** index
  end
  number_of_nodes
end

def tree_height(tree_as_list)
  return tree_as_list[-1][0] + 1 if (tree_as_list.length == 1) && (tree_as_list[-1].class == Array)
  tree_as_list[-1] = [tree_as_list[-1][0] + 1] if tree_as_list[-1].class == Array
  tree_as_list << [0] unless tree_as_list[-1].class == Array

  tree_as_list = tree_as_list[how_many_nodes_are_there_on_a_level(tree_as_list[-1][0] + 1), tree_as_list.length]
  tree_height(tree_as_list)
end

puts tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3

puts tree_height([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# => 4

puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# => 4