def is_there_a_way(graph, visited = [0], current_node = 0, target)
  return true if visited.include?(target)
  next_node = graph[current_node]
  return if next_node.nil?
  next_node.each do |node|
    unless visited.include?(node)
      visited << node
      return is_there_a_way(graph, visited, node, target)
    end
  end
  false
end

def depth_first_search_and_check_cycle(graph, visited = [0], current_node = 0)
  next_node = graph[current_node]
  return if next_node.nil?
  next_node.each do |sub_node|
    if visited.include?(sub_node)
      clone_graph = Hash[graph]
      clone_graph[current_node].delete(sub_node)
      clone_graph[sub_node].delete(current_node)
      return true if is_there_a_way(clone_graph, [current_node], current_node, sub_node) == true
    else
      visited << sub_node
      return true if depth_first_search_and_check_cycle(graph, visited, sub_node) == true
    end
  end
  return false
end

def graph_cycle?(graph)
  return depth_first_search_and_check_cycle(graph)
end

puts graph_cycle?({
  0=>[2],
  1=>[4],
  2=>[0, 5, 3],
  3=>[5, 2],
  4=>[5, 1],
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