require_relative './linked_list'
class Stack < LinkedList
  def push(number)
    add(number)
  end

  def pop
    value = get(@size - 1)
    remove(@size - 1)
    value
  end
end