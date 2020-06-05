class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

node3 = Node.new(3)
node2 = Node.new(2, node3)
node = Node.new(1, node2)

ObjectSpace.each_object(Node) do |object|
  p object
end