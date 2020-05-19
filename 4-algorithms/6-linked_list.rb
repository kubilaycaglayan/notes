class Node
  attr_accessor :value, :next_node, :head_node
  @@index = 0
  @@head_node = nil
  def initialize(value, _next_node = nil)
    @head_node = @@index == 0 ? true : @@head_node
    @@head_node = value if @@index == 0
    @value = value

    ObjectSpace.each_object(Node) do |object|
      object.next_node = value if object.next_node.nil?
    end

    @next_node = nil
    @@index += 1
  end
end

class LinkedList
  def add(number)
    Node.new(number)
  end

  def get(index)
    next_node = ObjectSpace.each_object(Node).first.head_node
    return next_node if index == 0
    current_index = 0

    until index == current_index
      ObjectSpace.each_object(Node) do |object|
        if object.value == next_node
          next_node = object.next_node
          current_index += 1
        end
        return object.next_node if index == current_index
      end
    end
  end
end

list = LinkedList.new

list.add(2)
list.add(89)
list.add(3)
list.add(8)
p list.get(2)

ObjectSpace.each_object(Node) do |object|
  p object
end


