require '../arrays&linked_lists/linked_list'

my_list = LinkedList.new

index = 0
while index < 2500
# while index < 2700 => throws error stack level too deep
  my_list.add(index)
  index += 1
end

p my_list.get_node(0)