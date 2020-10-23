require_relative 'bfs'

describe 'bfs' do
  let (:hash) {{
    0 => [2],
    1 => [4],
    2 => [5, 0, 3],
    3 => [2],
    4 => [1, 5],
    5 => [4, 2]
  }}

  let (:hash2) {{
    0 => [2],
    1 => [4],
    2 => [5, 0, 3, 6],
    3 => [2],
    4 => [1, 5, 6],
    5 => [4, 2],
    6 => [4, 2]
  }}

  it 'returns an array of nodes visited by dfs approach' do
    expect(bfs hash).to match [0, 2, 5, 3, 4, 1]
  end

  it 'returns an array of nodes visited by dfs approach - 2' do
    expect(bfs hash2).to match [0, 2, 5, 3, 6, 4, 1]
  end
end