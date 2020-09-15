def array_to_graph(array)
  result = {}
  array.each_with_index do |row, row_index|
    row.each_with_index do |value, col_index|
      unless value == 1
        cor = [row_index, col_index]
        result[cor] = []
        result[cor] << right = [row_index, col_index + 1] unless col_index == row.size - 1 || array[row_index][col_index + 1] == 1
        result[cor] << bottom = [row_index + 1, col_index] unless row_index == array.size - 1 || array[row_index + 1][col_index] == 1
      end
    end
  end
  result
end

def coordinates_of_nine(array)
  array.each_with_index do |row, row_index|
    row.each_with_index do |value, col_index|
      return [row_index, col_index] if value == 9
    end
  end
end

def path_search(graph, coord_nine, current_node = [0,0], walk = [], result = [])
  walk << current_node
  if current_node == coord_nine
    result << walk
    return
  end
  neighbours = graph[current_node]
  return if neighbours.empty? || neighbours.nil?
  neighbours.each do |neighbour|
    walk2 = walk.clone
    path_search(graph, coord_nine, neighbour, walk2, result)
  end
  result
end

def maze_escape(maze)
  graph = array_to_graph(maze)
  nine = coordinates_of_nine(maze)
  walks = path_search(graph, nine, [0,0])
  sizes = walks.map { |walk| walk.size }
  min_index = sizes.index(sizes.min)
  trans = walks[min_index].map do |walk|
    [walk[1], walk[0]]
  end
  trans
end

p maze_escape(
  [
    [0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 1, 0, 1, 1],
    [0, 1, 0, 0, 0],
    [0, 0, 0, 1, 9]
  ]
)
# => [
#      [0, 0],
#      [1, 0],
#      [2, 0],
#      [2, 1],
#      [2, 2],
#      [2, 3],
#      [3, 3],
#      [4, 3],
#      [4, 4]
#    ]

p maze_escape([[0, 0, 0, 0, 1, 0, 0],
               [0, 0, 0, 0, 1, 0, 0],
               [0, 1, 1, 1, 1, 1, 1],
               [0, 0, 0, 0, 0, 0, 9],
               [0, 1, 1, 1, 1, 0, 0],
               [0, 0, 0, 0, 1, 0, 0],
               [0, 0, 0, 0, 1, 0, 0]])

# expected: [[0, 0], [0, 1], [0, 2], [0, 3], [1, 3], [2, 3], [3, 3], [4, 3], [5, 3], [6, 3]]
# got: [[0, 0], [1, 0], [2, 0], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6]]
