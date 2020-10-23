class Node
  attr_accessor :left, :right
  attr_reader :root

  def initialize(value)
    @root = value
  end
end

def array_to_tree(arr, index)
  return nil if index >= arr.size || arr[index] == 0

  node = Node.new(arr[index])
  node.left = array_to_tree(arr, index*2 + 1)
  node.right = array_to_tree(arr, index*2 + 2)
  node
end

def find_height(tree)
  return 0 if tree.nil?
  return 1 if tree.left.nil? && tree.right.nil?

  [find_height(tree.left), find_height(tree.right)].max + 1
end

def binary_tree_height(array_tree)
  tree = array_to_tree(array_tree, 0)

  find_height(tree)
end

puts binary_tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3