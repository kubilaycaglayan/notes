require_relative './node'

class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def increase_size
    @size += 1
  end

  def decrease_size
    @size -= 1
  end

  def add(number)
    new_node = Node.new(number)

    if @head.nil?
      @head = new_node
      @tail = new_node
      increase_size
    else
      @tail.next_node = new_node
      @tail = new_node
      increase_size
    end
  end

  def add_at(index, value)
    new_node = Node.new(value)

    if index == 0
      new_node.next_node = @head
      @head = new_node
      increase_size
    elsif index == @size
      @tail.next_node = new_node
      @tail = new_node
      increase_size
    else
      previous_node = get_node(index - 1)
      next_node = get_node(index)
      previous_node.next_node = new_node
      new_node.next_node = next_node
      increase_size
    end
  end

  def remove(index)
    return if index < 0 || index > @size

    if index == 0
      next_node = get_node(1)
      @head = next_node
      decrease_size
    elsif index == @size - 1
      previous_node = get_node(index - 1)
      previous_node.next_node = nil
      @tail = previous_node
      decrease_size
    else
      next_node = get_node(index + 1)
      previous_node = get_node(index - 1)
      previous_node.next_node = next_node
      decrease_size
    end
  end

  def get_node(index)
    node = @head

    while index > 0
      node = node.next_node
      index -= 1
    end
    node
  end

  def get(index)
    node = @head

    while index > 0
      node = node.next_node
      index -= 1
    end
    node.value
  end

  def to_a
    array = []
    node = @head

    until node.nil?
      array << node.value
      node = node.next_node
    end

    array
  end
end

list = LinkedList.new

list.add(3)
list.add(5)
list.add_at(1, 11)
list.add_at(0, 13)

puts list.get(2)
# => 11

puts list.get(3)
# => 5

# 13 3 11 5

p list.to_a
