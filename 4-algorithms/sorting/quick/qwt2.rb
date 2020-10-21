require 'rspec'

def swap(array, i1, i2)
  array[i1], array[i2] = array[i2], array[i1]
end

def partition(array, st = 0, en = array.size - 1)
  return 0 if array.size == 1

  pivot = array[st]
  small_index = st + 1

  for i in (st + 1)..en
    if array[i] < pivot
      swap array, i, small_index
      small_index += 1
    end
  end
  swap array, st, small_index - 1

  small_index - 1
end

def quick(array, st = 0, en = array.size - 1)
  return if en - st < 2

  pivot = partition array, st, en

  quick array, st, pivot
  quick array, pivot + 1, en
end

describe 'swap' do
  let (:numbers) { (0..5).to_a }

  it 'swaps two elements' do
    swap numbers, 1, 2
    expect(numbers).to match [0, 2, 1, 3, 4, 5]
  end
end

describe 'partition' do
  let(:numbers) { (0..5).to_a.reverse }
  let(:single) { [18] }
  let(:empty) { [] }

  it 'returns the pivot point' do
    expect(partition numbers).to be 5
  end

  it 'mutates the array' do
    partition numbers
    expect(numbers).to match [0, 4, 3, 2, 1, 5]
  end

  it 'can mutate a specific range of the array' do
    partition numbers, 1, 3
    expect(numbers).to match [5, 2, 3, 4, 1, 0]
  end

  it 'can return the pivot in a specific range' do
    expect(partition numbers, 1, 3).to be 3
  end
end

describe 'quick' do
  let (:numbers) { (0..5).to_a.reverse }
  let (:numbers2) { (0..5).to_a.reverse }
  let(:single) { [18] }
  let(:empty) { [] }

  it 'sorts' do
    quick numbers
    expect(numbers).to match (0..5).to_a
    numbers2.insert(2, -5).insert(3, 99)
    quick numbers2
    expect(numbers2).to match [-5, 0, 1, 2, 3, 4, 5, 99]
  end

  it 'doesn\'t change a single sized array' do
    quick single
    expect(single).to match [18]
  end

  it 'returns empty array when an empty array given' do
    quick empty
    expect(empty.empty?).to be true
  end
end