require_relative './linked_list'

def find_middle_point(head)
  p1, p2 = head, head.next_node

  while p2 && p2.next_node
    p1 = p1.next_node
    p2 = p2.next_node.next_node
  end

  p1
end

head = LinkedList.new
5.times do |index|
  head.add(index + 1)
end

p find_middle_point head.head