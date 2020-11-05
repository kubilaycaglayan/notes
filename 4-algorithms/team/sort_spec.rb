def swap(array, index1, index2)
  array[index1], array[index2] = array[index2], array[index1]
end

def partition(array, st, en)
  pivot = array[en]
  small_index = st

  for i in st..en
    current = array[i]

    if current < pivot
      swap(array, i, small_index)
      small_index += 1
    end
  end

  swap(array, small_index, en)

  small_index
end

def advanced_quicksort(array, st = 0, en = array.size - 1)
  return if en - st < 1

  pivot_index = partition(array, st, en)

  return if en - st < 2
  p array
  left = advanced_quicksort(array, st, pivot_index - 1)
  right = advanced_quicksort(array, pivot_index, en)
end

system('clear')

describe 'partition' do
  let(:numbers) { (0..5).to_a.reverse } # [5, 4, 3, 2, 1, 0]
  it 'return the index of the pivot' do
    expect(partition(numbers, 1, 3)).to be 1
  end

  it 'reorders elements in the given range according to the pivot' do
    partition(numbers, 1, 3)
    expect(numbers).to match [5, 2, 3, 4, 1, 0]
  end

  it 'reorders elements even if the range has length 2' do
    partition(numbers, 1, 2)
    expect(numbers).to match [5, 3, 4, 2, 1, 0]
  end

  it 'reorders elements even if the range has length 2' do
    partition(numbers, 0, 5)
    p numbers
  end
end

describe 'swap' do
  let(:numbers) { (0..5).to_a }
  it 'swaps ' do
    swap(numbers, 1, 3)
    expect(numbers).to match [0, 3, 2, 1, 4, 5]
  end
end