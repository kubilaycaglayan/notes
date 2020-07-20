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

def in_order_check(node, parents = [], parent = nil, left = false)
  if node == nil
    return true
  end


  print "checking #{node.data} "
  unless parent.nil?
    parents << parent
    if left
      print " left check \n"
      return false unless parents.all? { |parent| parent > node.data }
    else
      print " right check \n"
      if node.data == 14
        puts
        p parents
      end
      return false unless parents.all? { |parent| parent < node.data }
    end
  end
  return false unless in_order_check(node.left, parents, node.data, true)
  # result += "#{node.data} "
  return false unless in_order_check(node.right, parents, node.data)
  return true
end

puts search_tree?([20, 10, 27, 5, 14, 23, 30])