require_relative './linked_list'
class StackOriginal < LinkedList
  def push(number)
    add(number)
  end

  def pop
    value = get(@size - 1)
    remove(@size - 1)
    value
  end
end

class Stack
  def initialize
    @min_stack = StackOriginal.new
    @main_stack = StackOriginal.new
  end

  def push(number)
    @min_stack.push(number) if @min_stack.empty?
    @min_stack.push(number) if number < min

    @main_stack.push(number)
  end

  def pop
    @min_stack.pop if min == @main_stack.pop
  end

  def min
    @min_stack.get(@min_stack.size - 1)
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