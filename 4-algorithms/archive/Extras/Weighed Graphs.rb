def matrix_into_hash(matrix)
  graph = Hash.new()
  matrix.each_with_index do |distances, current_stop|
    graph[current_stop] = []
    distances.each_with_index do |distance, relative_stop|
      graph[current_stop] << relative_stop if distance > 0
    end
  end
  graph
end

def weighted_graphs(matrix)
  graph = matrix_into_hash matrix
  # p graph
  queue = [0]
  visited_stops = [0]
  count = 0
  result = {}
  graph.size.times do |index|
    result[index] = []
  end
  result[0] << 0

  until queue.empty?
    # puts

    if queue[-1].nil?
      count += 1
      queue.pop
    end

    # puts "q: #{queue}"
    # puts " c: #{count}"

    next_stop = graph[queue.shift]

    mem = visited_stops.size
    next_stop.each do |stop|
      # puts "   stop: #{stop}"
      unless visited_stops.include? stop
        # puts "     add new: #{stop}"
        visited_stops << stop
        queue << stop
        result[stop] << count
      end
    end
    if visited_stops.size != mem
      queue << nil
    end
  end
  result
end

p weighted_graphs([[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]])
# => [0, 2, 1, 1, 2, 2]


p weighted_graphs([[0, 3, 6, 0, 0, 9, 4], [3, 0, 4, 1, 0, 0, 0], [6, 4, 0, 3, 5, 4, 1], [0, 1, 3, 0, 2, 0, 0], [0, 0, 5, 2, 0, 3, 0], [9, 0, 4, 0, 3, 0, 3], [4, 0, 1, 0, 0, 3, 0]])
# => [0, 1, 1, 2, 2, 1, 1]

p weighted_graphs([[0, 3, 6, 0, 0, 9, 4, 1, 0, 0], [3, 0, 4, 1, 0, 0, 0, 1, 2, 0], [6, 4, 0, 3, 5, 4, 1, 1, 3, 0], [0, 1, 3, 0, 2, 0, 0, 1, 4, 0], [0, 0, 5, 2, 0, 3, 0, 1, 3, 1], [9, 0, 4, 0, 3, 0, 3, 1, 2, 0], [4, 0, 1, 0, 0, 3, 0, 1, 1, 0], [1, 1, 1, 1, 1, 1, 1, 0, 1, 0], [0, 2, 3, 4, 3, 2, 1, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0, 0, 0] ])
# => [0, 1, 1, 2, 2, 1, 1, 1, 2, 3]

