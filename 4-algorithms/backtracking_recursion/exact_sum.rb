h = {}

ObjectSpace.count_objects(h)

puts h

def exact_sum?(sum, array)
  return true if sum == 0
  return false if sum < 0 || array.empty?

  exact_sum?(sum, array[1..-1]) || exact_sum?(sum - array[0], array[1..-1])
end

puts exact_sum?(12, [1, 2, 3, 4, 5])
# => true

puts exact_sum?(11, [1, 5, 9, 13])
# => false

ObjectSpace.count_objects(h)
puts h

def exact_sum_better_space_complexity?(sum, array, index = 0)
  return true if sum == 0
  return false if sum < 0 || index >= array.size

  exact_sum_better_space_complexity?(sum, array, index + 1) || exact_sum_better_space_complexity?(sum - array[index], array, index + 1)
end

puts exact_sum_better_space_complexity?(12, [1, 2, 3, 4, 5])
# => true

puts exact_sum_better_space_complexity?(11, [1, 5, 9, 13])
# => false

ObjectSpace.count_objects(h)
puts h