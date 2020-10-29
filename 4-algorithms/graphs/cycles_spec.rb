system('clear')

def cycle_helper(graph, target, child)
  queue = graph[child]
  queue.delete(target)

  visited = []

  until queue.empty?
    current_node = queue.shift
    next if visited.include?(current_node) || graph[current_node].nil?
    visited << current_node
    will_be_visited = graph[current_node].select { |n| !visited.include?(n) }

    queue = will_be_visited + queue
  end

  visited.include?(target) ? true : false
end

def graph_cycle?(graph)
  graph.keys.each do |key|
    graph[key].each do |n|
      next if graph[n].nil?
      if cycle_helper(graph, key, n)
        return true
      end
    end
  end
  false
end

def graph_cycle_model?(graph)
  # write your code here
  queue = [0]
  visited = []

  while queue.size != 0
    head = queue.shift
    visited << head

    not_visited = graph[head].reject { |node| visited.include? node }
    return true if not_visited.size < (graph[head].size - 1)

    visited += not_visited
    queue += not_visited
  end

  false
end

describe 'graph_cycle' do
  let(:graph1) do
    {
      0 => [2],
      1 => [4],
      2 => [0, 5, 3],
      3 => [5, 2],
      4 => [5, 1],
      5 => [4, 2, 3]
    }
  end
  let(:graph2) do
    {
      0 => [2],
      1 => [2],
      2 => [0, 1, 3, 4, 5],
      3 => [2],
      4 => [2]
    }
  end
  it 'returns true if the graph has a cycle' do
    expect(graph_cycle?(graph1)).to be true
  end

  it 'returns false if the graph doesn\'t have a cycle' do
    expect(graph_cycle?(graph2)).to be false
  end
end
describe 'graph_cycle_model' do
  let(:graph1) do
    {
      0 => [2],
      1 => [4],
      2 => [0, 5, 3],
      3 => [5, 2],
      4 => [5, 1],
      5 => [4, 2, 3]
    }
  end
  let(:graph2) do
    {
      0 => [2],
      1 => [2],
      2 => [0, 1, 3, 4, 5],
      3 => [2],
      4 => [2]
    }
  end
  it 'returns true if the graph has a cycle' do
    expect(graph_cycle_model?(graph1)).to be true
  end

  it 'returns false if the graph doesn\'t have a cycle' do
    expect(graph_cycle_model?(graph2)).to be false
  end
end

describe 'cycle_helper' do
  let(:graph1) do
    {
      0 => [2],
      1 => [4],
      2 => [0, 5, 3],
      3 => [5, 2],
      4 => [5, 1],
      5 => [4, 2, 3]
    }
  end
  let(:graph2) do
    {
      0 => [2],
      1 => [2],
      2 => [0, 1, 3, 4, 5],
      3 => [2],
      4 => [2]
    }
  end
  it 'detects cycles for a given graph and target and returns true if there is a cycle' do
    expect(cycle_helper(graph1, 5, 2)).to be true
  end

  it 'detects cycles for a given graph and target and returns true if there is a cycle' do
    expect(cycle_helper(graph1, 2, 5)).to be true
  end

  it 'detects cycles for a given graph and target and returns false if there is not a cycle' do
    expect(cycle_helper(graph1, 0, 2)).to be false
  end

  it 'detects cycles for a given graph and target and returns false if there is not a cycle' do
    expect(cycle_helper(graph2, 0, 2)).to be false
  end
end
