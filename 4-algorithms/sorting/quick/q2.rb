require 'rspec'

def quick(array)
  return array if array.empty? || array.size == 1

  pivot = array.first
  left, right = [], []

  for i in 1..(array.size - 1)
    if array[i] < pivot
      left << array[i]
    else
      right << array[i]
    end
  end

  quick(left) + [pivot] + quick(right)
end

describe 'quick' do
  let (:numbers) { (0..5).to_a.reverse }
  it 'sorts' do
    expect(quick numbers).to match (0..5).to_a
  end
end