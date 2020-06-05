require './6-linked_lists.rb'

class Stack < LinkedList
  def initialize
    @stack = LinkedList.new
  end

  def push(value)
    @stack.add(value)
  end

  def pop
    return "Can't pop, no nodes." if @stack.size == 0
    popped_value = @stack.get(@stack.size - 1)
    @stack.remove(@stack.size - 1)
    popped_value
  end

  def min
    node = @stack.head
    minimum_value = node.value
    index = @stack.size - 1
    while (index) > 0 && node
      node = node.next_node
      minimum_value = node.value if node.value < minimum_value
      index -= 1
    end

    minimum_value
  end
end

stack = Stack.new

stack.push(3)
stack.push(5)
puts stack.min
# => 3

stack.pop
stack.push(7)
puts stack.min
# => 3

stack.push(2)
puts stack.min
# => 2

stack.pop
puts stack.min
# => 3