require_relative 'node'

class LinkedList
  attr_accessor :head, :tail, :size
  def initialize
    @size = 0
  end

  def add(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
  end

  def get(index)
    node = @head

    while index > 0 && node
      node = node.next_node
      index -= 1
    end

    node.value
  end

  def set(value, index)
    node = @head

    while index > 0 && node
      node = node.next_node
      index -= 1
    end

    node.value = value
  end

  def add_at(index, value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      @tail = new_node
    elsif index == 0
      new_node.next_node = @head
      @head = new_node
    else
      previous_item = get_node(index - 1)
      next_item = get_node(index)
      previous_item.next_node = new_node
      new_node.next_node = next_item
      @tail = new_node if index == @size
    end
    @size += 1
  end

  def remove(index)
    remove_node = get_node(index)
    value = remove_node.value
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
    @size -= 1
    value
  end

  def nilling_index(node)
    node.value = nil
    node.next_node = nil
  end

  def show
    my_list = []
    ObjectSpace.each_object(Node) do |object|
      object
      my_list << object.value if object.value != nil
    end
    p my_list
  end

  def to_a
    if @size > 0
      node = @head
      result = []
      index = @size - 1
      while index > 0 && node
        result << node.value
        node = node.next_node
        index -= 1
      end
      result << node.value
      result
    else
      []
    end
  end

  def empty?
    @size == 0 ? true : false
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