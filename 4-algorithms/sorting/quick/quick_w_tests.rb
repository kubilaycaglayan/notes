require 'rspec'

def swap(array, i1, i2)
  array[i1], array[i2] = array[i2], array[i1]
end

def partition(array, st = 0, en = array.length - 1)
  return if array[st..en].empty?
  return 0 if array[st..en].size == 1

  pivot = array[st]
  small_index = st + 1

  for i in small_index..en
    if array[i] < pivot
      swap(array, i, small_index)
      small_index += 1
    end
  end
  swap(array, st, small_index - 1)

  small_index - 1
end

def quick(array, st = 0, en = array.size - 1)
  return if en - st < 2

  pivot = partition array, st, en

  quick array, st, pivot
  quick array, pivot + 1, en
end

describe 'swap' do
  let(:numbers) { (0..3).to_a }
  it 'swaps two indexes in a given array' do
    swap(numbers, 2, 3)
    expect(numbers).to match [0, 1, 3, 2]
  end
end

describe 'partition' do
  let (:numbers) { [2, 0, 1, 3, 4] }
  let (:empty) { [] }
  let (:single) { [2] }
  let (:numbers2) { [-1, 0, 5, 6, -3] }
  let (:numbers3) { [5, 4, 3, 2, 1, 0] }
  it 'mutates the array => puts the small numbers left and big numbers to right relative to the pivot' do
    partition numbers
    expect(numbers).to match [1, 0, 2, 3, 4]
    partition numbers2
    expect(numbers2).to match [-3, -1, 5, 6, 0]
  end

  it 'returns 0 if the array has single item' do
    expect(partition single).to be 0
  end

  it 'returns nil if the array is empty' do
    expect(partition empty).to be nil
  end

  it 'returns the pivot point' do
    expect(partition numbers).to be 2
  end

  it 'can take a starting end ending point' do
    expect(partition numbers3, 0, 5).to be 5
    expect(numbers3).to match [0, 4, 3, 2, 1, 5]
  end

  it 'can lookup in the middle' do
    expect(partition numbers3, 1, 3).to be 3
    expect(numbers3).to match [5, 2, 3, 4, 1, 0]
  end
end

describe 'quick' do
  let(:numbers) { (0..5).to_a.reverse }
  it 'sorts an array' do
    quick numbers
    expect(numbers).to match (0..5).to_a
  end
end