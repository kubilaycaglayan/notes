def bfs(graph)
  queue = [0]
  visited_nodes = [0]

  until queue.empty?
    next_node = graph[queue.shift]

    next_node.each do |node|
      unless visited_nodes.include?(node)
        visited_nodes << node
        queue << node
      end
    end
  end

  visited_nodes
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