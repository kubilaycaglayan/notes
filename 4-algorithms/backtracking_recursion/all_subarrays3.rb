def all_subsequences(array, result = [], level = array.size)
  p result if level == 0
  return if level == 0

  all_subsequences(array[1..-1], result.clone << array[0], level - 1)
  all_subsequences(array[1..-1], result.clone, level - 1)
end

all_subsequences [1, 2, 3]