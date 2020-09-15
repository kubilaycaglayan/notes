def delete_at(array, index)
  left = array[0..index]
  right = array[(index + 1)..-1]
  left.pop
  left + right
end

def sliding_maximum(k, numbers)
  indexes = Array.new
  result = Array.new

  numbers.each_with_index do |number, index|
    result << numbers[indexes.first] if index >= k
    indexes << index
    if indexes.size > 1
      repeat = indexes.size-1
      repeat.times do
        indexes = delete_at(indexes, (indexes.size - 2)) if numbers[indexes[-2]] < numbers[indexes[-1]]
      end
    end
    indexes.shift if (index - indexes.first) >= k
  end
  result << numbers[indexes.first]
  p result
end

sliding_maximum(3, [1, 3, 5, 7, 9, 2])
# => [5, 7, 9, 9]

# İlk sayıyı en büyük olarak depola
# ikinci sayıyı kıyasya
# 