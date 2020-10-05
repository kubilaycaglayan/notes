class QuickSort
  def initialize(array)
    @array = array
    sort
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
    p @array
    small_index
  end

  def sort(starting = 0, length = @array.length)
    return if length - starting < 2

    pivot_index = partition(starting, length)

    sort(starting, pivot_index)
    sort(pivot_index + 1, length)
  end
end

def advanced_quicksort(array)
  QuickSort.new(array)
end

advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# => 1 3 2 5 9 7 8
#    1 2 3 5 9 7 8
#    1 2 3 5 7 8 9
puts
advanced_quicksort([9, 8, 6, 7, 3, 5, 4, 1, 2])
