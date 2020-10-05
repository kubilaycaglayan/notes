def find_pairs2(array, k)
  sorted = array.push(k).sort
  sliced = sorted[0, sorted.index(k)]
  result = []
  sliced.each_with_index do |num, index|
    possible_pairs = sliced.clone
    possible_pairs.delete_at(index)
    possible_pairs.each do |num2|
      result << [num, num2] if num + num2 == k
    end
  end
  result
end

def find_pairs(array, k)
  result = []
  count = 0
  array.each_with_index do |num, index|
    break if index == array.length - 1
    array[index + 1..-1].each do |num2|
      sum = num + num2
      result << [num, num2] if sum == k
      count += 1
    end
  end
  p count
  result
end

p find_pairs([1, 9, 11, 13, 2, 3, 7], 12)
# => [[1, 11], [9, 3]]

p find_pairs([-8, 7, 11, 8, 5, 9, 3, 6, 2, -9, 4], 0)
# => [[-8, 8], [9, -9]]