require '/home/kubilay/Documents/Personal-Projects/4-algorithms/6-linked-lists add_at and remove.rb'

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

queue = Queue.new
queue.add(3)
queue.add(5)
puts queue.remove
# => 3

queue.add(2)
queue.add(7)
puts queue.remove
# => 5

puts queue.remove
# => 2

puts queue.remove
# => 7

puts queue.remove
# => -1