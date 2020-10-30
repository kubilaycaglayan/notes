def merge_sort(array1, array2)
  return array1 if array2.empty?
  return array2 if array1.empty?

  result = []
  i = 0
  j = 0

  loop do
    num1 = array1[i]
    num2 = array2[j]
    if num1 < num2
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

system 'clear'
p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]

describe 'merge_sort' do
  let(:arr1) { [1, 3, 9, 11] }
  let(:arr2) { [2, 4, 6, 8] }
  it 'pass through the arrays one time and returns one sorted array' do
    expect(merge_sort(arr1, arr2)).to match [1, 2, 3, 4, 6, 8, 9, 11]
  end

  it 'handles empty arrays' do
    expect(merge_sort([], arr1)).to match [1, 3, 9, 11]
  end

  it 'handles arrays with 1 length' do
    expect(merge_sort([4], [2])).to match [2, 4]
  end
end
