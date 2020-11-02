def duplicates(arr1, arr2)
  arr2 = arr2.clone
  arr1.each do |num|
    arr2.delete_at(arr2.index(num))
  end

  arr2
end

describe 'duplicates' do
  it 'returns the duplicate numbers' do
    expect(duplicates(
      [203, 204, 205, 206, 207, 208, 203, 204, 205, 206],
      [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 204, 205, 206]
      )).to match [204, 205, 206]
  end
end