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

def search_tree?(array)
	root = array_to_tree(array)

  search_helper(root)
end

def search_helper (node, min = nil, max = nil)
  return true if node.nil?

  return false if min && node.data < min
  return false if max && node.data > max

  search_helper(node.left, min, node.data) && search_helper(node.right, node.data, max)
end


puts search_tree?([20, 10, 27, 5, 14, 23, 30])
puts search_tree?([20, 10, 27, 5, 14, 23, 30, 0, 12, 0, 0, 0, 0, 0, 0])