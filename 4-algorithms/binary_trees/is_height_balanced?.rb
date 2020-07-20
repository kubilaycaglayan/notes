class Node
	attr_reader :data
  attr_accessor :left, :right

  def initialize data
    @data = data
  end
end

# helper function
def array_to_tree(array, index = 0)
	# use your function from the previous challenge
end

# helper function
def height(node)
	# use your function from the previous challenge
end

def balanced_tree?(array)
  root = array_to_tree(array)
	# write your code here
end

puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true