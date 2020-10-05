class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)

  node
end

def tree_to_array(node, result = [])
  if node == nil
    return
  end

  result << node.data
  tree_to_array(node.left, result)
  tree_to_array(node.right, result)
  result
end

tree = array_to_tree([10, 1, 2, 3, 4, 5, 6], 0)
p tree_to_array(tree)