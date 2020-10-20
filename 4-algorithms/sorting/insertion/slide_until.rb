def slide_until(array, token)
  for i in 1...array.length
    val = array[i]
    j = i - 1
    while j >= 0 && val == token
      array[j + 1] = array[j]
      j -= 1
    end

    array[j + 1] = val
  end
end

numbers = (0..4).to_a
numbers << 'a'
numbers << 8
numbers << 8
numbers << 8
numbers << 8
numbers << 'a'
numbers << 'a'
numbers << 'a'
numbers << 'a'

p numbers
slide_until numbers, 8
p numbers