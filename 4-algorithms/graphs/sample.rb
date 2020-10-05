def graph(hash_grap, key = 0, result = [])
  result << key
  return result if key == 4
  graph(hash_grap, hash_grap[key][0], result)
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
