def partition(array)
  pivot = array.first
  left = []
  right = []

  for i in 1...array.size
    if pivot > array[i]
      left << array[i]
    else
      right << array[i]
    end
  end

  left + [pivot] + right
end

describe 'partition' do
  it 'picks the pivot and reorders the elements in the array relative to the pivot' do
    expect(partition [4, 5, 3, 9, 1]).to match [3, 1, 4, 5, 9]
  end
end