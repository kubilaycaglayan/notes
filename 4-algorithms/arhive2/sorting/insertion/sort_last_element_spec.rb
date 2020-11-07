def insertion_sort(array)
  result = []
  rightmost = array.last
  i = array.size - 2
  while i >= 0 && rightmost < array[i]
    array[i + 1] = array[i]
    i -= 1
    result << array.clone
  end
  array[i + 1] = rightmost
  result << array.clone
end

system('clear')

describe 'insertion_sort' do
  let(:array1) { [1, 3, 2] }
  let(:array2) { [1, 4, 6, 9, 3] }
  it 'prints out every move in the array' do
    expect(insertion_sort array1).to match [
      [1, 3, 3],
      [1, 2, 3]
    ]
  end

  it 'prints out every move in the array' do
    expect(insertion_sort array2).to match [
      [1, 4, 6, 9, 9],
      [1, 4, 6, 6, 9],
      [1, 4, 4, 6, 9],
      [1, 3, 4, 6, 9]
    ]
  end
end