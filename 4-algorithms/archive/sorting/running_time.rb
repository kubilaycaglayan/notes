def running_time(array)
  number_of_shifts = 0
  for i in 1...array.length
    value_to_insert = array[i]
    j = i - 1
    while j >= 0 && value_to_insert < array[j]
      number_of_shifts += 1
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = value_to_insert
  end
  number_of_shifts
end

puts running_time([2, 1, 3, 1, 2])
# => 4