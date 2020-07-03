class Node
  attr_accessor :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def add(value)
    new_node = Node.new(value)

    if @head.nil?
      #we are not adding for the first time
      @head = new_node
      @tail = new_node
    else
      #we are adding to our list for the first time
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def get(index)
    node = @head
    count = 0
    while count <= index - 1 && node.next_node
      node = node.next_node
      count += 1
    end
    node
  end
end

list = LinkedList.new

list.add(34)
list.add(35)
list.add(36)

p list.get(1)

ObjectSpace.each_object(Node) do |object|
  p object
end