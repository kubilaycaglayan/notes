def depth_first_search(graph, visited = [0], current_node = 0)
  next_node = graph[current_node]
  return if next_node.nil?
  next_node.each do |node|
    unless visited.include?(node)
      visited << node
      depth_first_search(graph, visited, node)
    end
  end
  visited
end

p depth_first_search({
  0=>[1, 2],
  1=>[0, 2],
  2=>[0, 1, 3, 4, 5],
  3=>[2, 4],
  4=>[3, 2],
  5=>[2]
  })
# => [0, 1, 2, 3, 4, 5]

p depth_first_search({
  0=>[2],
  1=>[2],
  2=>[0, 1, 3, 4, 5],
  3=>[2],
  4=>[2]
})
# => [0, 2, 1, 3, 4, 5]