def insertion(array)
  for i in 1...array.length
    value_to_insert = array[i]
    j = i - 1
    while j >= 0 && value_to_insert < array[j]
      array[j + 1] = array[j]
      j = j - 1
    end
    array[j + 1] = value_to_insert
    puts array.join(' ')
  end
end


insertion([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9