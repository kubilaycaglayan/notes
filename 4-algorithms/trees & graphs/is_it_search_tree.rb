class Node
	attr_reader :data
	attr_accessor :left, :right

	def initialize data
		@data = data
	end
end

def array_to_tree(array, index = 0)
  return if index > array.size - 1
  root = Node.new(array[index])

  root.left = array_to_tree(array, index * 2 + 1)
  root.right = array_to_tree(array, index * 2 + 2)

  root
end

def min(tree, min = nil)
  return if tree.nil? || tree.data.zero?
  min = [tree.data] if min.nil?
  min[0] = tree.data if min.first > tree.data
  min(tree.left, min)
  min(tree.right, min)
  p min
  min.first
end

def max(tree, max = nil)
  return if tree.nil? || tree.data.zero?
  max = [tree.data] if max.nil?
  max[0] = tree.data if max.first < tree.data
  max(tree.left, max)
  max(tree.right, max)
  max.first
end

def check(root)
  return true if root.nil?
  if root.left && !root.left.data.zero?
    p max(root.left), root.data
    return false if max(root.left) > root.data
  end

  if root.right && !root.right.data.zero?
    return false if min(root.right) < root.data
  end

  return check(root.left) && check(root.right)
end

def check_with_memoizating(root, min = nil, max = nil)
  return true if root.nil? || root.data.zero?

  return false if min && root.data < min
  return false if max && root.data > max

  check_with_memoizating(root.left, min, root.data) &&
  check_with_memoizating(root.right, root.data, max)
end

def search_tree?(array, root = nil)
	root = array_to_tree(array)
  check_with_memoizating(root)
end


# puts search_tree?([10, 4, 12])
# => true

# puts search_tree?([10, 5, 7])
# => false

system("clear")
p "version: #{(rand * 100).ceil}"
puts