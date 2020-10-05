def duplicates(arr1, arr2)
  arrTwo = arr2.clone
  arrOne = arr1.clone
  deleted = 0
  count = 0

  arr2.each_with_index do |number_b, index2|
    arr1.each_with_index do |_, index1|
      count += 1
      number_a = arrOne[index1 - deleted]
      if number_b == number_a
        arrTwo.delete_at(index2 - deleted)
        arrOne.delete_at(index1 - deleted)
        deleted += 1
        break
      end
    end
  end
  arrTwo
end

p duplicates([203, 204, 205, 206, 207, 208, 203, 204, 205, 206], [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 204, 205, 206])
# => [204, 205, 206]