def neighbours(map)
  mapping = {}
  map.each_with_index do |row, row_index|
    row.each_with_index do |value, column_index|
      neighbs = []
      neighbs << [row_index, column_index - 1] unless column_index == 0
      neighbs << [row_index, column_index + 1] unless column_index == row.size - 1
      neighbs << [row_index - 1, column_index] unless  row_index == 0
      neighbs << [row_index + 1, column_index] unless  row_index == map.size - 1
      mapping[[row_index, column_index]] = neighbs
    end
  end
  mapping
end

def peaks(map, hash)
  result = []
  hash.each do |self_coord, neighbs|
    srow = self_coord[0]
    scol = self_coord[1]
    peak = neighbs.all? do |neighb_coord|
      nrow = neighb_coord[0]
      ncol = neighb_coord[1]
      map[srow][scol] > map[nrow][ncol]
    end
    result << self_coord if peak
  end
  result
end

def depth_first_search(graph, visited = [0], current_node = 0, map, peaks)
  next_node = graph[current_node]
  return if next_node.nil?
  return if peaks.include? current_node
  check_this_array_for_max_val = []
  next_node.each do |coords|
    value = map[coords[0]][coords[1]]
    check_this_array_for_max_val << value
  end
  max_neighbour = check_this_array_for_max_val.max
  index = check_this_array_for_max_val.index(max_neighbour)
  coord_of_max_neighbour = next_node[index]
  unless visited.include?(coord_of_max_neighbour)
    visited << coord_of_max_neighbour
    depth_first_search(graph, visited, coord_of_max_neighbour, map, peaks)
  end

  visited
end

def greatest_peaks(map)
  neigbhs = neighbours(map)
  peaks = peaks(map, neigbhs)
  controlled_by = {}

  count = {}
  peaks.each do |peak|
    count[peak] = 1
  end

  neigbhs.each do |self_coord, neig_coord|
    walk = depth_first_search(neigbhs, [self_coord], self_coord, map, peaks)
    unless walk.nil?
      count[walk[-1]] += 1
    end
  end
  p [count.values.min, count.values.max]
end

greatest_peaks(
  [
    [9, 8, 5],
    [5, 6, 3],
    [8, 4, 1]
  ]
)
# => [3, 6]

greatest_peaks(
  [
    [8, 12],
    [9, 3]
  ]
)
# => [1, 3]
