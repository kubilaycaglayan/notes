$result = []

def simple_quicksort(array)
  return array if array.size < 2

  left, pivot, right, pivot_index = partition array

  snap = simple_quicksort(left) + [pivot] + simple_quicksort(right)
  $result << snap
  snap
end

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

  return left, pivot, right, left.size
end

system 'clear'

describe 'simple_quicksort' do
  it 'returns an array of arrays => snapshots after every partitioning method' do
    simple_quicksort([5, 8, 1, 3, 7, 10, 2])
    expect($result).to match [
      [2, 3],
      [1, 2, 3],
      [7, 8, 10],
      [1, 2, 3, 5, 7, 8, 10]
    ]
  end

  it 'picks the pivot and reorders the elements in the array relative to the pivot, and returns the pivot index' do
    expect(partition [4, 5, 3, 9, 1]).to match [[3, 1], 4, [5, 9], 2]
  end
end