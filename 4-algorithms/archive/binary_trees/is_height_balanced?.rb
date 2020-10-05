class Node
	attr_reader :data
  attr_accessor :left, :right

  def initialize data
    @data = data
  end
end

# helper function
def array_to_tree(array, index = 0)
  return nil if index >= array.length || array[index] == 0

  node = Node.new(array[index])
  node.left = array_to_tree(array, 2 * index + 1)
  node.right = array_to_tree(array, 2 * index + 2)

  node
end

# helper function
def binary_tree_height(node, results = [], result = 0)
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

def balanced_tree?(array)
  root = array_to_tree(array)
	balance_helper(root)
end

def balance_helper(node)
  return true if node.nil?

  return false unless ((binary_tree_height(node.left) - binary_tree_height(node.right)).abs < 2) && balance_helper(node.left) && balance_helper(node.right)

  return true
end

puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true

puts balanced_tree?([1, 2, 3, 4, 0, 0, 5, 6, 0, 0, 0, 0, 0, 0, 7])
# => false