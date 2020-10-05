require '../6-linked_lists'

class HashTable
  attr_reader :mappings
  def initialize(hash_index = 11)
    @hash_index = hash_index
    @mappings = LinkedList.new
    hash_index.times { |i| @mappings.add([])}
  end

  def add(value)
    hash_function(value)
  end

  def list
    list = []
    @hash_index.times do |i|
      list << @mappings.get(i)
    end
    list
  end

  private

  def add_to_te_list(index, value)
    before = @mappings.get(index)
    before.push(value)
    @mappings.set(before, index)
  end

  def hash_function(value)
    index = which_index(value)
    add_to_te_list(index, value)
  end

  def which_index value
    value.abs % @hash_index
  end
end

def hash_table(array)
  table = HashTable.new
  array.each do |element|
    table.add(element)
  end
  table.list
end

p hash_table([12, 24, 125, 5, 91, 1106, 2, 1021, 29, 3536, 10])
# => [12, 24, 2, 91, 125, 5, 3536, 1106, 29, 1021, 10]

p hash_table([2, 341, 73, 8265, 234004, 602, 7400000, 200000000])
# => [341, 234004, 2, 200000000, 7400000, 8265, 73, 602]

p hash_table([2367, -65325, 134, -185007, 3291, 7832, -65326, 789, 980, -3289, 3])
# =>expected:[7832, -3289, 980, 2367, 134, 3291, 3, -65325, -65326, 789, -185007]
# => got:    [7832, -3289, 980, 2367, 134, -185007, 3291, -65326, 3, -65325, 789]