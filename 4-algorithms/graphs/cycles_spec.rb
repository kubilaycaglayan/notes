def graph_cycle?(graph)
  queue = [0]
  visited = []

  until queue.empty?
    current_node = queue.shift
    next if visited.include? current_node

    visited << current_node
    will_be_visited = graph[current_node].select { |n| !visited.include? n}

    queue = will_be_visited + queue
  end
end

puts graph_cycle?({
  0=>[2],
  1=>[4],
  2=>[0, 5, 3],
  3=>[5, 2],
  4=>[5, 1],+
  5=>[4, 2, 3]
})
# => true

puts graph_cycle?({
  0=>[2],
  1=>[2],
  2=>[0, 1, 3, 4, 5],
  3=>[2],
  4=>[2]
})
# => false

system('clear')

describe 'graph_cycle' do
  let (:graph1) {{
    0=>[2],
    1=>[4],
    2=>[0, 5, 3],
    3=>[5, 2],
    4=>[5, 1],
    5=>[4, 2, 3]
  }}
  let (:graph2) {{
    0=>[2],
    1=>[2],
    2=>[0, 1, 3, 4, 5],
    3=>[2],
    4=>[2]
  }}
  it 'returns true if the graph has cycle' do
    expect(graph_cycle? graph1).to be true
  end

  it 'returns false if the graph has cycle' do
    expect(graph_cycle? graph2).to be false
  end
end