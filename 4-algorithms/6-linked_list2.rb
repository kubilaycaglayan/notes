class Node
  attr_accessor :value, :next_node, :head_node, :index

  @@head_node = nil
  def initialize(value, index)
    if index == 0
      @@head_node = value
      @head_node = true
    end

    @head_node = @@head_node if index != 0
    @value = value

    ObjectSpace.each_object(Node) do |object|
      object.next_node = value if object.next_node.nil?
    end

    @next_node = nil
    @index = index
  end
end

class LinkedList
  def initialize
    @index = 0
  end

  def add(number)
    Node.new(number, @index)
    @index += 1
  end

  def get(index)
    return nil if ObjectSpace.each_object(Node).count < index
    next_node = ObjectSpace.each_object(Node).first.head_node
    current_index = 0

    ObjectSpace.each_object(Node) do |object|
      return object.value if object.index == index
    end
  end
end

numbers1 = [3, 4, 1, 7, 5, 3, 5, 3]
numbers2 = [5, 4, 1, 7, 5, 3, 3]


list1 = LinkedList.new
list2 = LinkedList.new

numbers1.each do |number|
  list1.add(number)
end
p list1.get(0)

ObjectSpace.each_object(Node) do |object|
  p object
end

numbers2.each do |number|
  list2.add(number)
end

p list2.get(0)

ObjectSpace.each_object(Node) do |object|
  p object
end




