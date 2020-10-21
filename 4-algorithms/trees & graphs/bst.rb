class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

class BST
  attr_reader :root

  def insert(node, head = @root)
    if @root.nil?
      @root = node
      return
    end

    return node if head.nil?

    if node.data < head.data
      head.left = insert(node, head.left)
    else
      head.right = insert(node, head.right)
    end

    head
  end

  def pre_order(node = @root)
    return '' if node.nil? || node.data.nil?
    result = ''

    result << "#{node.data} "
    result << pre_order(node.left)
    result << pre_order(node.right)
  end
end


def binary_search_tree(array)
  tree = BST.new
  array.each { |e| tree.insert(Node.new(e)) }
  tree.pre_order
end

# puts binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
# => "8 3 1 6 4 7 10 14 13"

puts
print 'version: ', (rand * 100).floor
puts