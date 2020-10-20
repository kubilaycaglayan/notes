require 'rspec'

def insertion(array)
  for i in 1..(array.length - 1) # n - 1
    val = array[i]
    j = i - 1

    while j >= 0 && array[j] > val # n
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = val
  end
end

describe 'insertion sort' do
  let (:numbers) { (0..5).to_a.reverse }

  it 'sorts' do
    insertion numbers
    expect(numbers).to match (0..5).to_a
  end
end