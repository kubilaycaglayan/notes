def graph_cycle?(graph)
  # write your code here
  queue = [0]
  visited = []

  while queue.size != 0
    head = queue.shift
    visited << head

    not_visited = graph[head].reject { |node| visited.include? node }
    puts "____"
    puts "head: #{head}"
    puts "  not visited: #{not_visited}"
    puts "  sub_nodes: #{graph[head]}"
    puts "____"
    puts "  visited: #{visited}"
    return true if not_visited.size < (graph[head].size - 1)

    visited += not_visited
    queue += not_visited
  end

  false
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
  4=>[2],
  5=>[2]
})
# => false