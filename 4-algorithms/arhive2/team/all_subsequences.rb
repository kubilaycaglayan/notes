def all_the_subsequences_of_an_array(array, result = [], level = array.size)
  p result if level == 0
  return if level == 0

  all_the_subsequences_of_an_array(array[1..-1], result.clone, level - 1)
  all_the_subsequences_of_an_array(array[1..-1], result.clone << array[0], level - 1)
end

all_the_subsequences_of_an_array [1, 2, 3]