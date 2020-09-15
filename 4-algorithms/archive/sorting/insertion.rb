def helper(array)
  last = array.last
  return array if array.last > array[-2]
  array[-1] = ''
  array.reverse.each_with_index do |num, index|
    next if index == 0
    current_index = - index - 1
    next_index = - index
    before_index = - index - 2
    before = array[before_index]
    array[next_index] = num
    if before.nil? || (last < num && before < last)
      array[current_index] = last

      break
    end
  end
  array
end

def sort_itself(array)
  array.each_with_index do |num, index|
    next if index < 1
    array[0, index + 1] = helper(array[0, index + 1])
    print array.join(' '), "\n"
  end
end

sort_itself([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9