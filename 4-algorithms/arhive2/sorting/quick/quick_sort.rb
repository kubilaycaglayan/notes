require 'rspec'

def swap(array, i1, i2)
  array[i1], array[i2] = array[i2], array[i1]
end

def partition(array, st = 0, en = array.size - 1)
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
  let (:numbers) { (0..3).to_a }
  it 'swaps two elements of the array' do
    swap numbers, 1, 2
    expect(numbers).to match [0, 2, 1, 3]
  end
end

describe 'partition' do
  let (:numbers) { (0..5).to_a.reverse }

  it 'mutates the array' do
    partition numbers
    expect(numbers).to match [0, 4, 3, 2, 1, 5]
  end

  it 'returns the pivot point' do
    expect(partition numbers).to be 5
  end

  it 'returns the pivot point in a given range' do
    expect(partition numbers, 1, 3).to be 3
  end

  it 'mutates the array in a given range' do
    partition numbers, 1, 3
    expect(numbers).to match [5, 2, 3, 4, 1, 0]
  end
end

describe 'quick' do
  let (:numbers) { (0..5).to_a.reverse }
  let (:single) { [18] }
  let (:empty) { [] }

  it 'sorts 😊 in place' do
    quick numbers
    expect(numbers).to match (0..5).to_a
  end

  it 'doesn\'t change the single sized array' do
    quick single
    expect(single).to match single
  end

  it 'doesn\'t change the empty array' do
    quick empty
    expect(empty.empty?).to be true
  end
end