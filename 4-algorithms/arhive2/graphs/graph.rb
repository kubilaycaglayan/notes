def graph(hash_graph)
  target = hash_graph[0].first
  result = [0, target]

  until target == 4
    target = hash_graph[target].first
    result << target
  end

  result
end

hash = {
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
}

p graph(hash)
# => [0, 2, 5, 4]
