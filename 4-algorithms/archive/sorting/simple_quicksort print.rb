def partition(array)

  pivot = array.first
  left, right = [], []

  for i in 1...array.length
    number = array[i]
    if number <= pivot
      left << number
    else
      right << number
    end
  end


  return {
    :left => left,
    :pivot => [pivot],
    :right => right,
  }
end

def helper(array)
  return {:pivot => array,
    :left => [],
    :right => []} if array.size < 2
    partition(array) if array.size == 2
  left, pivot, right = partition(array).values_at(:left, :pivot, :right)
  sorted_left_left, sorted_left_pivot, sorted_left_right = helper(left).values_at(:left, :pivot, :right)
  sorted_right_left, sorted_right_pivot, sorted_right_right = helper(right).values_at(:left, :pivot, :right)

  [[sorted_left_left, sorted_left_pivot, sorted_left_right], pivot, [sorted_right_left, sorted_right_pivot, sorted_right_right]].flatten.each_with_index do |num, index|
    print "#{" " if index != 0}#{num}"
  end
  puts "\n"

  return {
    :left => [sorted_left_left, sorted_left_pivot, sorted_left_right].flatten,
    :pivot => [pivot].flatten,
    :right => [sorted_right_left, sorted_right_pivot, sorted_right_right].flatten,
  }
end

def simple_quicksort(array)
  left, pivot, right = helper(array).values_at(:left, :pivot, :right)

  #[left, pivot, right].flatten
  ""
end

p simple_quicksort([5, 8, 1, 3, 7, 10, 2])
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10