class QuickSort
  attr_reader :runtime
  def initialize(array)
    @array = array.clone
    @runtime = 0
    sort
  end

  def raise_runtime
    @runtime += 1
  end

  def swap(small_index, swap_index)
    @array[small_index], @array[swap_index] = @array[swap_index], @array[small_index]
    raise_runtime
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

class InsertionSort
  attr_reader :runtime
  def initialize(array)
    @array = array.clone
    @runtime = 0
    sort
  end

  def raise_runtime
    @runtime += 1
  end

  def sort
    for i in 1...@array.length
      value_to_insert = @array[i]
      j = i - 1
      while j >= 0 && value_to_insert < @array[j]
        @array[j + 1] = @array[j]
        j = j - 1
        raise_runtime
      end
      @array[j + 1] = value_to_insert
    end
  end
end

def quicksort_running_time(array)
  insertion = InsertionSort.new(array).runtime - quick = QuickSort.new(array).runtime
end

puts quicksort_running_time([1, 3, 9, 8, 2, 7, 5])
# => 1
