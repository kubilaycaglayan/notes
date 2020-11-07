system('clear')

def appears_most_times(array)
  counter = Hash.new(0)
  max = [0, 0]

  array.each do |n|
    value = counter[n]
    value += 1
    max = [n, value] if value > max.last
    counter[n] = value
  end

  max.first
end

describe 'appears_most_times' do
  let(:input1) { [1, 2, 3, 1, 5] }
  let(:input2) { [23, 43, 67, 88, 42, 35, 77, 88, 99, 11] }
  let(:input3) { [4376, -345, -345, 4376, -345, 84945, 4376, -345, -26509, 4376, 84945, 84945, -26509, 896341, 4376] }

  it 'returns the number appears the most times' do
    expect(appears_most_times input1).to be 1
  end
  it 'returns the number appears the most times' do
    expect(appears_most_times input2).to be 88
  end
  it 'returns the number appears the most times' do
    expect(appears_most_times input3).to be 4376
  end
end