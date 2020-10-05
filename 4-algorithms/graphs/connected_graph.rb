def depth_first_search(graph, visited = [0], next_node = graph[0])
  next_node.each do |node|
    unless visited.include?(node)
      visited << node
      depth_first_search(graph, visited, graph[node])
    end
  end
  return visited
end

def connected_graph?(graph)
  visited = depth_first_search(graph)
  return visited.sort == graph.keys.sort
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