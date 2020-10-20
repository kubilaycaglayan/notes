def insertion(array)
  for i in 1...array.length
    value_to_swap = array[i]
    j = i - 1

    while j >= 0 && value_to_swap < array[j]
      array[j + 1] = array[j]
      j -= 1
    end

    array[j + 1] = value_to_swap
  end
end

numbers = (0..8).to_a
numbers[3] = 12

insertion numbers

p numbers