require 'set'

def find_duplicates(array)
  result = []
  my_set = Set.new

  array.each do |e|
    if my_set.include? e
      result << e
    else
      my_set.add e
    end
  end

  result
end

system('clear')
describe 'find_duplicates' do
  let(:array1) { [1, 2, 3, 1, 5, 6, 7, 8, 5, 2] }
  let(:array2) { [3, 501, 17, 23, -43, 67, 5, 888, -402, 235, 77, 99, 311, 1, -43] }
  let(:array3) { [1, 2, 3, 1, 1, 3, 3] }
  it 'returns an array of recurring elements in the same order and as many times as they repeat' do
    expect(find_duplicates array1).to match [1, 5, 2]
  end

  it 'returns an array of recurring elements in the same order and as many times as they repeat' do
    expect(find_duplicates array2).to match [-43]
  end

  it 'returns an array of recurring elements in the same order and as many times as they repeat' do
    expect(find_duplicates array3).to match [1, 1, 3, 3]
  end
end