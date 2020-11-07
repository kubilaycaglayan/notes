def merge_sort(array1, array2)
  return array1 if array2.empty?
  return array2 if array1.empty?

  result = []
  i = 0
  j = 0

  loop do
    num1 = array1[i]
    num2 = array2[j]
    if num1.to_i <= num2.to_i
      result << num1
      i += 1
    else
      result << num2
      j += 1
    end

    if i >= array1.size
      result << array2[j..-1]
      break
    elsif j >= array2.size
      result << array1[i..-1]
      break
    end
  end

  result.flatten
end

def merge_helper(array)
  if array.size < 3
    return merge_sort(array.clone[0...(array.size / 2)], array.clone[(array.size / 2)...array.size])
  end

  left = merge_helper(array.clone[0...(array.size / 2)])
  right = merge_helper(array.clone[(array.size / 2)...array.size])

  merge_sort left, right
end

def full_merge_sort(array)
  result = merge_helper(array)
  result.map { |string| string.split.last }
end

describe 'full_merge_sort' do
  it 'sorts a given array with merge sort approach' do
    expect(full_merge_sort(["0 ab", "6 cd", "0 ef", "6 gh", "4 ij", "0 ab", "6 cd", "0 ef", "6 gh", "0 ij", "4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])).to match ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]
  end
end