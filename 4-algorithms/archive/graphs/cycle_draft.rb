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

def depth_first_search(graph, visited = [0], current_node = 0)
  next_node = graph[current_node]
  return if next_node.nil?
  next_node.each do |sub_node|
    if visited.include?(sub_node)
      puts
      puts "visited sub_node detected"
      puts "current_node: #{current_node} => #{graph[current_node]}"
      puts "sub_node: #{sub_node} => #{graph[sub_node]}"
      clone_graph = Hash[graph]
      clone_graph[current_node].delete(sub_node)
      clone_graph[sub_node].delete(current_node)
      # can i reach to the current_node agan with the current_node being deleted from sub_nodes sub_nodes
      if is_there_a_way(clone_graph, [current_node], current_node, sub_node) == true
        puts "cycle"
      end
    else
      visited << sub_node
      depth_first_search(graph, visited, sub_node)
    end
  end
end

def graph_cycle?(graph)
  depth_first_search(graph)
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
puts "__________________________ 2. example________________"
puts graph_cycle?({
  0=>[2],
  1=>[2],
  2=>[0, 1, 3, 4, 5],
  3=>[2],
  4=>[2]
})
# => false