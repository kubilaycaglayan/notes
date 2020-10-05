class QuickSort
  def initialize(array)
    @array = array.clone
    sort
  end

  def swap(small_index, swap_index)
    @array[small_index], @array[swap_index] = @array[swap_index], @array[small_index]
  end

  def partition(starting, ending)
    small_index = starting
    pivot = @array[ending - 1]

    # iteration trough the array
    for i in starting...ending
      current = @array[i]
      if pivot > current
        swap(small_index, i)
        small_index += 1
      end
    end
    swap(small_index, ending - 1)
    # p @array
    small_index
  end

  def sort(starting = 0, ending = @array.length)
    # define the base case
    if ending - starting < 2
      puts 'here'
      p @array[starting, ending - starting]
      return
    end

    p pivot = partition(starting, ending)

    sort(starting, pivot)
    sort(pivot + 1, ending)
  end
end

def advanced_quicksort(array)
  QuickSort.new(array)
end

advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# => 1 3 2 5 9 7 8
#    1 2 3 5 9 7 8
#    1 2 3 5 7 8 9