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

  in_order_check(root)
end

def in_order_check(node, in_order = [])
  return true if node.nil?

  return false unless in_order_check(node.left, in_order)
  unless in_order.empty?
    # puts "#{node.data} <=> #{in_order}"
    return false unless in_order.all? { |number| number < node.data }
  end
  in_order << node.data
  return false unless in_order_check(node.right, in_order)
  return true
end

puts search_tree?([20, 10, 27, 5, 14, 23, 30])
puts search_tree?([20, 10, 27, 5, 14, 23, 30, 0, 12, 0, 0, 0, 0, 0, 0])