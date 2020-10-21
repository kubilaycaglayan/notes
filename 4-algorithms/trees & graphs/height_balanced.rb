class Node
	attr_reader :data
  attr_accessor :left, :right

  def initialize data
    @data = data
  end
end

# helper function
def array_to_tree(array, index = 0)
  return if index > array.size - 1 || array[index].zero?

  head = Node.new(array[index])

  head.left = array_to_tree(array, index * 2 + 1)
  head.right = array_to_tree(array, index * 2 + 2)

  head
end

# helper function
def height(tree)
  return 0 if tree.nil?
  return 1 if (tree.left.nil? && tree.right.nil?)

  [height(tree.left), height(tree.right)].max + 1
end

def balance_helper(root)
  return true if root.nil?

  return false if (height(root.left) - height(root.right)).abs > 1

  balance_helper(root.left) && balance_helper(root.right)
end

def balanced_tree?(array)
  root = array_to_tree(array)

  balance_helper(root)
end

system('clear')
# puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false

# puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true