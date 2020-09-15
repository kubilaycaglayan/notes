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

def dfs(graph, maze, current_node = [0,0], walk = [])
  next_node = graph[current_node]
  walk << current_node
  if next_node.nil? || next_node.empty?
    p walk
  end
  next_node.each do |cord|
    dfs(graph, maze, cord, walk)
  end
end

def maze_escape(maze)
  graph = array_to_graph(maze)
  graph.each do |current_node, next_node|
    dfs(graph, maze, current_node = [0,0])
  end
end

maze_escape(
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
