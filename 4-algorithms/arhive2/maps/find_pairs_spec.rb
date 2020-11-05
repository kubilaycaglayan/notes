def find_pairs(array, k)
  result = []
  for i in 0...array.size
    current = array[i]
    for j in (i + 1)...array.size
      second = array[j]
      pair = [current, second]
      result << pair if pair.sum == k
    end
  end

  result
end

describe 'find_pairs' do
  it 'returns the pairs which sums up to the given input' do
    expect(find_pairs([1, 9, 11, 13, 2, 3, 7], 12)).to match [[1, 11], [9, 3]]
  end
end