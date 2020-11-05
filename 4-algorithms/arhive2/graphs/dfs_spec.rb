def depth_first_search(graph)
  queue = [0]
  visited = []

  until queue.empty?
    current_node = queue.shift
    next if visited.include? current_node
    visited << current_node
    will_be_visited = graph[current_node].select { |n| !visited.include? n }
    queue = will_be_visited + queue
  end

  visited
end

p depth_first_search({
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
})
# => [0, 2, 5, 4, 1, 3]

describe 'depth_first_search' do
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
    2 => [5, 0, 3],
    3 => [2, 6],
    4 => [1, 5],
    5 => [4, 2],
    6 => [3]
  }}

  let (:hash3) {{0=>[1, 2], 1=>[0, 3, 4], 2=>[0, 5, 6], 3=>[1], 4=>[1, 5], 5=>[2, 4], 6=>[2]}}

  it 'returns an array of visited nodes with the dfs approach' do
    expect(depth_first_search hash).to match [0, 2, 5, 4, 1, 3]
  end

  it 'returns an array of visited nodes with the dfs approach - 2' do
    expect(depth_first_search hash2).to match [0, 2, 5, 4, 1, 3, 6]
  end

  it 'returns an array of visited nodes with the dfs approach - 2' do
    expect(depth_first_search hash3).to match [0, 1, 3, 4, 5, 2, 6]
  end
end