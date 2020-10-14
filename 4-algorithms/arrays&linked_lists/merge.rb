require_relative 'linked_list'

def merge(h1, h2)
  curr = h1
  next_node = h1.next_node
  curr2 = h2
  next2 = h2.next_node

  until next_node.nil?
    curr.next_node = curr2
    curr2.next_node = next_node

    curr = next_node
    next_node = next_node.next_node
    curr2 = next2
    next2 = next2.next_node unless next2.nil?
  end

  curr.next_node = curr2
  curr2.next_node = nil unless curr2.nil?
end

h1 = LinkedList.new
5.times do |index|
  h1.add(index + 1)
end

h2 = LinkedList.new
5.times do |index|
  h2.add(index + 101)
end

p h1.to_a
p h2.to_a
merge h1.head, h2.head

p h1.to_a