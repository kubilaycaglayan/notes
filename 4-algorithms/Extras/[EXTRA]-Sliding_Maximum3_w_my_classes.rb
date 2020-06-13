require './6-linked_lists.rb'

def sliding_maximum(k, numbers)
  indexes = LinkedList.new
  result = LinkedList.new

  numbers.each_with_index do |number, index|
    result.add(numbers[indexes.get(0)]) if index >= k
    indexes.add(index)
    if indexes.size > 1
      repeat = indexes.size-1
      repeat.times do
        indexes.remove(indexes.size - 2) if numbers[indexes.get(indexes.size-2)] < numbers[indexes.get(indexes.size-1)]
      end
    end
    indexes.remove(0) if (index - indexes.get(0)) >= k
  end
  result.add(numbers[indexes.get(0)])
  p result.to_a
end

sliding_maximum(4, [9, 3, 5, 1, 7, 10])
# => [5, 7, 9, 9]

# İlk sayıyı en büyük olarak depola
# ikinci sayıyı kıyasya
# 