system 'clear'
def swap(array, index1, index2)
  array[index1], array[index2] = array[index2], array[index1]
end

def partition(array, index1, index2)
  pivot = array[index2]
  small_index = index1

  for i in index1..index2
    current = array[i]
    if current < pivot
      swap(array, i, small_index)
      small_index += 1
    end
  end
  swap(array, small_index, index2)

  small_index
end


def advanced_quicksort(array, index1 = 0, index2 = array.length - 1)
  return if index2 - index1 < 1

  pivot_index = partition array, index1, index2
  return if index2 - index1 < 2
  p array
  left = advanced_quicksort array, index1, pivot_index - 1
  right = advanced_quicksort array, pivot_index, index2
end
# advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# => 1 3 2 5 9 7 8
#    1 2 3 5 9 7 8
#    1 2 3 5 7 8 9
#
describe 'swap' do
  let(:unsorted1) { [1, 3, 9, 8, 2, 7, 5] }
  it 'swaps two elements with given indexes' do
    swap unsorted1, 1, 3
    expect(unsorted1).to match [1, 8, 9, 3, 2, 7, 5]
  end
end

describe 'partition' do
  let(:unsorted1) { [1, 3, 9, 8, 2, 7, 5] }
  it 'makes an inplace sort in a given index range and returns pivot' do
    expect(partition unsorted1, 1, 4).to be 1
    expect(unsorted1).to match [1, 2, 9, 8, 3, 7, 5]
  end

  it 'makes an inplace sort in a given index range and returns pivot' do
    expect(partition unsorted1, 3, 5).to be 4
    expect(unsorted1).to match [1, 3, 9, 2, 7, 8, 5]
  end

  it 'makes an inplace sort in a given index range and returns pivot' do
    expect(partition unsorted1, 1, 4).to be 1
    expect(unsorted1).to match [1, 2, 9, 8, 3, 7, 5]
  end
end

describe 'advanced_quicksort' do
  let(:unsorted1) { [1, 3, 9, 8, 2, 7, 5] }
  let(:unsorted2) { [1, 3, 9, 8, 12, 7, 5] }
  it 'sorts an unsorted array' do
    advanced_quicksort unsorted1
    expect(unsorted1).to match [1, 2, 3, 5, 7, 8, 9]
  end

  it 'sorts an unsorted array' do
    advanced_quicksort unsorted2
    expect(unsorted2).to match [1, 3, 5, 7, 8, 9, 12]
  end

  it 'handles a range of length 1' do
    advanced_quicksort unsorted2, 2, 3
    expect(unsorted2).to match [1, 3, 8, 9, 12, 7, 5]
  end

  it 'handles a ranges that is smaller than 1' do
    advanced_quicksort unsorted2, 3, 3
    expect(unsorted2).to match [1, 3, 9, 8, 12, 7, 5]
  end
end
=begin
expected block to output
"[1, 2, 6, 7, 3, 5, 4, 9, 8]\n
[1, 2, 6, 7, 3, 5, 4, 8, 9]\n
[1, 2, 3, 4, 6, 5, 7, 8, 9]\n
[1, 2, 3, 4, 6, 5, 7, 8, 9]\n
[1, 2, 3, 4, 5, 6, 7, 8, 9]\n
" to stdout, but output
"[1, 2, 6, 7, 3, 5, 4, 9, 8]\n
[1, 2, 6, 7, 3, 5, 4, 8, 9]\n
[1, 2, 3, 4, 6, 5, 7, 8, 9]\n
[1, 2, 3, 4, ..., 7, 8, 9]\n
[1, 2, 3, 4, 5, 6, 7, 8, 9]\n
[1, 2, 3, 4, 5, 6, 7, 8, 9]\n
[1, 2, 3, 4, 5, 6, 7, 8, 9]\n
"
=end