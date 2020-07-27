def is_there_a_way(graph, visited = [0], current_node = 0, target)
  return true if visited.include?(target)
  next_node = graph[current_node]
  return if next_node.nil?
  next_node.each do |node|
    unless visited.include?(node)
      visited << node
      return true if is_there_a_way(graph, visited, node, target) == true
    end
  end
  return false
end

p is_there_a_way({
  0=>[2],
  1=>[4],
  2=>[0, 5, 3],
  3=>[5, 2],
  4=>[5, 1],
  5=>[4, 2, 3]
},
visited = [5],
current_node = 5,
target = 3)