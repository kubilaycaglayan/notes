class IndexMatch
  attr_reader :runtime
  def initialize(array)
    @array = array.clone
    @runtime = 0
  end

  def raise_runtime
    @runtime += 1
  end

  def go_left(index)
    index < @array[index] ? true : false
  end

  def win(index)
    index == @array[index] ? true : false
  end

  def midpoint(starting, ending)
    ((starting + ending) / 2.0).ceil
  end

  def partition(starting = 0, ending = (@array.length - 1))
    raise_runtime
    return -1 if ending - starting < 0
    midpoint = midpoint(starting, ending)
    return midpoint if win(midpoint)
    if go_left(midpoint)
      partition(starting, midpoint - 1)
    else
      partition(midpoint + 1, ending)
    end
  end

  def find
    result = partition
    result
  end
end

def index_match(array)
  index = IndexMatch.new(array)
  index.find
end

puts index_match([0, 2, 3, 7, 9, 11])
# => 0