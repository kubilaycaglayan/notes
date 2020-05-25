class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail

  def add(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def get(index)
    node = @head

    while index > 0 && node
      node = node.next_node
      index -= 1
    end

    node.value
  end

  def add_at(index, value)
    new_node = Node.new(value)

    previous_item = get_node(index - 1)
    next_item = get_node(index)

    new_node.next_node = next_item
    if index == 0
      @head = new_node
    else
      previous_item.next_node = new_node
    end
  end

  def remove(index)
    remove_node = get_node(index)
    if remove_node == @head
      next_item = get_node(index + 1)
      @head = next_item
      nilling_index(remove_node)
    elsif remove_node == @tail
      previous_item = get_node(index - 1)
      previous_item.next_node = nil
      @tail = previous_item
      nilling_index(remove_node)
    else
      next_item = get_node(index + 1)
      previous_item = get_node(index - 1)
      previous_item.next_node = next_item
      nilling_index(remove_node)
    end
  end

  def nilling_index(node)
    node.value = nil
    node.next_node = nil
  end

  private 

  def get_node(index)
    node = @head

    while index > 0 && node
      node = node.next_node
      index -= 1
    end

    node
  end
end

list = LinkedList.new

list.add(0)
list.add(1)
list.add(2)
list.add(3)
list.remove(3)
puts "__HEAD:__ #{list.head.inspect}"
puts "__TAIL:__ #{list.tail.inspect}"

my_list = []
ObjectSpace.each_object(Node) do |object|
  p object
  my_list << object.value if object.value != nil
end
p my_list