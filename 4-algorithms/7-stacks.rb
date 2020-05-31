require '/home/kubilay/Documents/Personal-Projects/4-algorithms/6-linked-lists add_at and remove.rb'

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

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.pop
# => 5

stack.push(2)
stack.push(7)
puts stack.pop
# => 7

puts stack.pop
# => 2

puts stack.pop
# => 3

puts stack.pop