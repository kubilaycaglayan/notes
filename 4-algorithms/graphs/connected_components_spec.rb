def connected_graph?(graph)
  queue = [0]
  visited = []

  until queue.empty?
    current_node = queue.shift
    next if visited.include? current_node

    visited << current_node
    will_be_visited = graph[current_node].reject { |n| visited.include? n }

    queue = will_be_visited + queue
  end

  return true if visited.sort == graph.keys.sort
  false
end

puts connected_graph?({
  0 => [2],
  1 => [4],
  2 => [0, 5, 3],
  3 => [5, 2],
  4 => [5, 1],
  5 => [4, 2, 3]
})
# => true

puts connected_graph?({
  0 => [1, 2],
  1 => [0, 2],
  2 => [0, 1, 3, 4, 5],
  3 => [2, 4],
  4 => [3, 2],
  5 => [2]
})
# => true
system("clear")
describe 'connected_components' do
  let (:graph1) {{
    0 => [1, 2],
    1 => [0, 2],
    2 => [0, 1, 3, 4, 5],
    3 => [2, 4],
    4 => [3, 2],
    5 => [2]
  }}

  let (:graph2) {{
    0 => [2],
    1 => [4],
    2 => [0, 5, 3],
    3 => [5, 2],
    4 => [5, 1],
    5 => [4, 2, 3]
  }}

  let (:graph3) {{
    0 => [2],
    1 => [4],
    2 => [0, 5, 3],
    3 => [5, 2],
    4 => [5, 1],
    5 => [4, 2, 3],
    6 => [7],
    7 => [6]
  }}

  it 'returns true if the graph is a connected graph' do
    expect(connected_graph? graph1).to be true
  end

  it 'returns true if the graph is a connected graph' do
    expect(connected_graph? graph2).to be true
  end

  it 'returns false if the graph is a NOT a connected graph' do
    expect(connected_graph? graph3).to be false
  end
end