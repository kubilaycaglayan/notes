system('clear')

def hash_table(numbers)
  table = Hash.new([])

  numbers.each do |number|
    index = number.abs % 11
    table[index] = table[index].clone << number
  end

  table.sort.map { |pair| pair.last }.flatten
end

describe 'hash_table' do
  let(:numbers1) { [12, 24, 125, 5, 91, 1106, 2, 1021, 29, 3536, 10] }
  let(:numbers2) { [2, 341, 73, 8265, 234004, 602, 7400000, 200000000] }
  let(:numbers3) { [2367, -65325, 134, -185007, 3291, 7832, -65326, 789, 980, -3289, 3] }

  it 'returns the numbers as they appear on the hash table' do
    expect(hash_table numbers1). to match [12, 24, 2, 91, 125, 5, 3536, 1106, 29, 1021, 10]
  end
  it 'returns the numbers as they appear on the hash table' do
    expect(hash_table numbers2). to match [341, 234004, 2, 200000000, 7400000, 8265, 73, 602]
  end
  it 'returns the numbers as they appear on the hash table' do
    expect(hash_table numbers3). to match [7832, -3289, 980, 2367, 134, 3291, 3, -65325, -65326, 789, -185007]
  end
end