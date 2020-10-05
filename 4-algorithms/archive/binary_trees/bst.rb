class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

class BST
  attr_reader :root
  def initialize
    @root = nil
    @node_count = 0
  end

  def insert(node, root = @root)
    @root = node if @root.nil?
    if root == nil
      root = node
      return node
    end

    if root.data > node.data
      root.left = insert(node, root.left)
    else
      root.right = insert(node, root.right)
    end
    @node_count += 1
    return root
  end

  def pre_order(node = @root)
    if node == nil
      return ''
    end

    result = "#{node.data} "
    result += pre_order(node.left)
    result += pre_order(node.right)
    result
  end
end


def binary_search_tree(array)
  tree = BST.new
  array.each { |e| tree.insert(Node.new(e)) }
  tree.pre_order
end

puts binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
# => "8 3 1 6 4 7 10 14 13"
# ObjectSpace.each_object(Node) do |object|
#   p object
# end
