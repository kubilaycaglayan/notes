class Median
  def initialize(array)
    @array = array
    sort
  end

  def result
    @array[@array.length / 2]
  end

  def swap(small_index, swap_index)
    @array[small_index], @array[swap_index] = @array[swap_index], @array[small_index]
  end

  def partition(starting, length)
    small_index = starting
    pivot = @array[length - 1]
    for i in starting...(length - 1)
      current = @array[i]
      if pivot > current
        swap(small_index, i)
        small_index += 1
      end
    end
    swap(small_index, length - 1)
    small_index
  end

  def sort(starting = 0, length = @array.length)
    return if length - starting < 2

    pivot_index = partition(starting, length)

    sort(starting, pivot_index)
    sort(pivot_index + 1, length)
  end
end

def median(array)
  med = Median.new(array)
  med.result
end

puts median([0, 1, 2, 4, 6, 5, 3])
# => 3