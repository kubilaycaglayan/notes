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

def binary_tree_height(tree)
  return 0 if tree.nil?
  return 1 if tree.left.nil? && tree.right.nil?

  [binary_tree_height(tree.left), binary_tree_height(tree.right)].max + 1
end

tree_node = array_to_tree([2, 7, 5, 2, 6, 0, 9])
puts binary_tree_height(tree_node)
# => 3

puts binary_tree_height(nil)