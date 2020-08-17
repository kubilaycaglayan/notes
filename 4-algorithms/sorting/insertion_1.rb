def insertion_sort(array)
  last = array.last
  array[-1] = ''
  array.reverse.each_with_index do |num, index|
    next if index == 0
    current_index = - index - 1
    next_index = - index
    before_index = - index - 2
    before = array[before_index]
    array[next_index] = num
    print array.join(' '), "\n"
    if before.nil? || (last < num && before < last)
      array[current_index] = last
      print array.join(' '), "\n"
      break
    end
  end
end

insertion_sort([1, 3, 2])
# => 1 3 3
#    1 2 3

puts '-' * 20

insertion_sort([1, 4, 6, 9, 3])
# => 1 4 6 9 9
#    1 4 6 6 9
#    1 4 4 6 9
#    1 3 4 6 9

puts '-' * 20

insertion_sort([1, 4, 6, 9, 0])