require_relative 'is_it_search_tree'

describe 'array_to_tree' do
  it 'converts an array into a tree node' do
    expect(array_to_tree([10]).data).to be 10
    expect(array_to_tree([10, 4, 12]).right.data).to be 12
    expect(array_to_tree([10, 4]).left.data).to be 4
    expect(array_to_tree([10, 4, 12, 5]).left.left.data).to be 5
    expect(array_to_tree([10, 4, 12, 5, 0, 1, 3]).right.right.data).to be 3
  end

  it 'converts an array into a tree node 2' do
    tree = array_to_tree [10, 5, 12, 1, 2]
    expect(tree.left.left.data).to be 1
    expect(tree.left.right.data).to be 2
    expect(tree.right.right).to be nil
  end

  it 'converts an array into a tree node 3' do
    tree = array_to_tree [10, 5, 12, 1, 2, 0, 0]
    expect(tree.right.right.data).to be 0
  end
end

describe 'search_tree?' do
  it 'detects if the tree is a proper BST' do
    expect(search_tree? [10, 4, 12]).to be true
  end

  it 'detects if the tree is not a proper BST' do
    expect(search_tree? [10, 5, 7]).to be false
  end

  it 'detects if the tree is not a proper BST deeper' do
    expect(search_tree? [10, 5, 12, 1, 2]).to be false
  end

  it 'detects if the tree is a proper BST deeper' do
    expect(search_tree? [10, 5, 12, 1, 6]).to be true
  end

  it 'detects if the tree is a proper BST deeper' do
    expect(search_tree?([21, 11, 26, 5, 14, 23, 30, 2, 8, 13, 16, 0, 0, 0, 0])).to be true
  end
end

describe 'min' do
  it 'finds the minimum value' do
    tree = array_to_tree([5, 8, 12, 1, 3, 5, 9])
    expect(min(tree)).to be 1
  end
end

describe 'max' do
  it 'finds the maximum value' do
    tree = array_to_tree([5, 8, 12, 1, 3, 5, 9])
    expect(max(tree)).to be 12
  end
end