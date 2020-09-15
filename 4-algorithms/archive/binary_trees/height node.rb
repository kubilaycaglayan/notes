class Node
	attr_reader :data
  attr_accessor :left, :right

  def initialize data
    @data = data
  end
end

def array_to_tree(array, index = 0)
  return nil if index >= array.length || array[index] == 0

  node = Node.new(array[index])
  node.left = array_to_tree(array, 2 * index + 1)
  node.right = array_to_tree(array, 2 * index + 2)

  node
end

def binary_tree_height(node, results =[], result = 0)
  if node == nil
    return 0
  else
    result += 1
  end

  binary_tree_height(node.left, results, result)
  binary_tree_height(node.right, results, result)
  results << result
  results.max
end

tree_node = array_to_tree([2, 7, 5, 2, 6, 0, 9])
puts binary_tree_height(tree_node)
# => 3

puts binary_tree_height(nil)