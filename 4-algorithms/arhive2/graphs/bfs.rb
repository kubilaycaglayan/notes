def bfs(graph)
  queue = graph[0]
  visited = [0]

  until queue.empty?
    current_node = queue.shift
    visited << current_node
    graph[current_node].each do |node|
      queue << node unless visited.include? node
    end
  end

  visited.uniq
end

p bfs({
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
})
# => [0, 2, 5, 3, 4, 1]