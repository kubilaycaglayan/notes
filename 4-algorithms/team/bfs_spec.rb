def depth_first_search(graph)
  queue = [0]
  visited = []

  until queue.empty?
    current_node = queue.shift
    next if visited.include? current_node

    visited << current_node

    will_be_visited = graph[current_node].select { |n| !visited.include?(n) }

    queue = will_be_visited + queue
  end

  visited
end

system('clear')
describe 'depth_first_search' do
  let(:graph1) { {0=>[1, 2], 1=>[0, 2], 2=>[0, 1, 3, 4, 5], 3=>[2, 4], 4=>[3, 2], 5=>[2]} }
  let(:graph2) { {0=>[1, 2], 1=>[0, 3, 4], 2=>[0, 5, 6], 3=>[1], 4=>[1], 5=>[2], 6=>[2]} }
  let(:graph3) { {0=>[3], 1=>[2, 3], 2=>[4, 1], 3=>[1, 0], 4=>[2]} }
  let(:graph4) { {0=>[1, 2], 1=>[0, 3, 4], 2=>[0, 5, 6], 3=>[1], 4=>[1, 5], 5=>[2, 4], 6=>[2] } }
  let(:graph5) { {
    0 => [2],
    1 => [4],
    2 => [5, 0, 3],
    3 => [2],
    4 => [1, 5],
    5 => [4, 2]
  } }

  it 'returns an array with the nodes in the order of visit' do
    expect(depth_first_search graph1).to match [0, 1, 2, 3, 4, 5]
  end
  it 'returns an array with the nodes in the order of visit' do
    expect(depth_first_search graph2).to match [0, 1, 3, 4, 2, 5, 6]
  end
  it 'returns an array with the nodes in the order of visit' do
    expect(depth_first_search graph3).to match [0, 3, 1, 2, 4]
  end
  it 'returns an array with the nodes in the order of visit' do
    expect(depth_first_search graph4).to match [0, 1, 3, 4, 5, 2, 6]
  end
  it 'returns an array with the nodes in the order of visit' do
    expect(depth_first_search graph5).to match [0, 2, 5, 4, 1, 3]
  end
end