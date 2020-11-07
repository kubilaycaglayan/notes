require_relative 'graph'

describe 'grap' do
  let (:hash) do
    {
      0 => [2],
      1 => [4],
      2 => [5, 0, 3],
      3 => [2],
      4 => [1, 5],
      5 => [4, 2]
    }
  end

  let (:hash2) do
    {
      0 => [3],
      1 => [4],
      2 => [5, 0, 3],
      3 => [2],
      4 => [1, 5],
      5 => [4, 2]
    }
  end

  let (:hash3) do
    {
      0 => [4],
      1 => [4],
      2 => [5, 0, 3],
      3 => [2],
      4 => [1, 5],
      5 => [4, 2]
    }
  end
  let (:hash4) do
    {
      0 => [1],
      1 => [4],
      2 => [5, 0, 3],
      3 => [2],
      4 => [1, 5],
      5 => [4, 2]
    }
  end
  it 'returns an array with the traversed nodes until the target node 4' do
    expect(graph(hash)).to match [0, 2, 5, 4]
  end

  it 'returns an array with the traversed nodes until the target node 4 - 2' do
    expect(graph(hash2)).to match [0, 3, 2, 5, 4]
  end

  it 'returns an array with the traversed nodes until the target node 4 - 2' do
    expect(graph(hash3)).to match [0, 4]
  end

  it 'returns an array with the traversed nodes until the target node 4 - 2' do
    expect(graph(hash4)).to match [0, 1, 4]
  end
end