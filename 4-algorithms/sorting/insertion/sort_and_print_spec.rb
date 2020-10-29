def sort_itself(array)
  result = []
  for i in 1...array.size
    current = array[i]
    j = i - 1
    while j >= 0 && current < array[j]
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = current
    # print
    result << array.clone
  end
  result
end

describe 'sort_itself' do
  let(:array) { [1, 4, 3, 6, 9, 2] }
  it 'returns and array of arrays => as snapshots of the insertion progress' do
    expect(sort_itself array).to match [
      [1, 4, 3, 6, 9, 2],
      [1, 3, 4, 6, 9, 2],
      [1, 3, 4, 6, 9, 2],
      [1, 3, 4, 6, 9, 2],
      [1, 2, 3, 4, 6, 9]
    ]
  end
end