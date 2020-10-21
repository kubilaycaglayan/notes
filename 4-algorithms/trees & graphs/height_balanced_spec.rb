require_relative 'height_balanced'

describe 'array_to_tree' do
  it 'converts the array into tree' do
    tree = array_to_tree [1, 2, 0, 3, 4, 0, 0]
    expect(tree.data).to be 1
    expect(tree.right).to be nil
  end
end

describe 'height' do
  it 'returns the max height of a node' do
    tree = array_to_tree [1, 2, 0, 3, 4, 0, 0]
    expect(height tree).to be 3
  end

  it 'returns the max height of a node' do
    tree = array_to_tree [1, 2, 0]
    expect(height tree).to be 2
  end
end

describe 'balanced_tree?' do
  it 'returns true if the tree is balanced' do
    tree = [1, 2, 3, 4, 5, 6, 7]
    expect(balanced_tree? tree).to be true
  end

  it 'returns false if the tree is not balanced' do
    tree = [1, 2, 0, 3, 4, 0, 0]
    expect(balanced_tree? tree).to be false
  end
end