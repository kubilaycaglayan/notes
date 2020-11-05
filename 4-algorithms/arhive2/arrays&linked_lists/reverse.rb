require_relative './linked_list'

head = LinkedList.new
10.times do |index|
  head.add(index + 1)
end

def reverse(head)
  prev = nil
  curr = head.head
  next_node = head.head.next_node

  until curr.nil?
    curr.next_node = prev
    prev = curr
    curr = next_node
    next_node = next_node.next_node
  end

  curr.next_node = prev
  head.head = curr
end

reverse(head)

p head.to_a
puts