def partition(array)
  pivot = array.first

  left = []
  right = []

  for i in 1...array.length
    number = array[i]
    if number <= pivot
      left << number
    else
      right << number
    end
  end

  left.concat([pivot], right)
end

p partition([4, 5, 3, 9, 1])
# => [3, 1, 4, 5, 9]