require './6-linked_lists.rb'

class Queue
  def initialize
    @list = LinkedList.new
  end

  def add(value)
    @list.add(value)
  end

  def remove
    return -1 if @list.size == 0
    @list.remove(0)
  end

  def show
    @list.show
  end
end