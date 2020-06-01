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
end
