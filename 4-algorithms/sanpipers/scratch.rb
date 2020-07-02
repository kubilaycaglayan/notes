puts
def print_objects_w_message(class_name, message)
  show = lambda do |object|
    p object
  end

  puts "___________#{message}___________"
  each_object = ObjectSpace.each_object(class_name, &show)
  puts
end



class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
	  @value = value
    @next_node = next_node
  end
end

node1 = Node.new(1991)
node2 = Node.new(2001)

node1.next_node = node2

print_objects_w_message(Node, 'Created first node...')

class LinkedList
  def add(value)
    new_node = Node.new(value)
    #EDGE CASES
    # 1-) my linked list is empty
    #     - make @head equals to new_node
  end 

  def get(index)
  end
end