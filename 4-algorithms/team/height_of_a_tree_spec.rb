def binary_tree_height(array_tree)
  st = 0
  en = 0
  level = 0


  until (array_tree.slice(st, (en - st + 1)).all?(0) || array_tree.slice(st, (en - st + 1)).empty?)

    st = (st * 2) + 1
    en = (en * 2) + 2

    level += 1
  end

  level
end

system('clear')

describe 'binary tree height' do
  let(:tree1) { [2, 7, 5, 2, 6, 0, 9] }
  let(:tree2) { [5, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30] }

  it 'calculatess the height of a tree' do
    expect(binary_tree_height(tree1)).to eq 3
  end

  it 'calculatess the height of a tree' do
    expect(binary_tree_height(tree2)).to eq 5
  end
end