def change_min(min, destination, distance)
  return unless min.empty? || distance < min[1]

  min[0] = destination
  min[1] = distance
end

def populate_visited_and_distances(possible_next_stops, visited, distances)
  new_connection = possible_next_stops.sort_by! { |min| min[1] }.first

  visited << new_connection.first
  distances << new_connection.last
end

def explore_new_connection(matrix, visited, possible_next_stops)
  possible_next_stops = []

  visited.each do |origin|
    min = []

    matrix[origin].each_with_index do |distance, destination|
      next if distance.zero? || visited.include?(destination)

      change_min(min, destination, distance)
    end

    possible_next_stops << min unless min.empty?
  end

  possible_next_stops
end

def minimum_spanning_tree(matrix, start_from = 0)
  visited = [start_from]
  distances = []

  while visited.size < matrix.size
    possible_next_stops = explore_new_connection(matrix, visited, possible_next_stops)

    populate_visited_and_distances(possible_next_stops, visited, distances)
  end

  distances
end

system 'clear'

describe 'minimum_spanning_tree' do
  it 'returns the minimum distances in the order of visit by starting from 0' do
    expect(
      minimum_spanning_tree(
        [
          [0, 4, 1, 4, 0, 0, 0, 0, 0, 0],
          [4, 0, 5, 0, 9, 9, 0, 7, 0, 0],
          [1, 5, 0, 3, 0, 0, 0, 9, 0, 0],
          [4, 0, 3, 0, 0, 0, 0, 10, 0, 18],
          [0, 9, 0, 0, 0, 2, 4, 0, 6, 0],
          [0, 9, 0, 0, 2, 0, 2, 8, 0, 0],
          [0, 0, 0, 0, 4, 2, 0, 9, 3, 9],
          [0, 7, 9, 10, 0, 8, 9, 0, 0, 8],
          [0, 0, 0, 0, 6, 0, 3, 0, 0, 9],
          [0, 0, 0, 18, 0, 0, 9, 8, 9, 0]
        ], 0)).to match [1, 3, 4, 7, 8, 2, 2, 3, 8]

  end

  it 'returns the minimum distances in the order of visit by starting from 0' do
    expect(
      minimum_spanning_tree(
        [
          [0, 0, 1, 3, 0, 0],
          [0, 0, 0, 5, 0, 0],
          [1, 0, 0, 2, 1, 4],
          [3, 5, 2, 0, 7, 0],
          [0, 0, 1, 7, 0, 2],
          [0, 0, 4, 0, 2, 0]
        ], 0)).to match [1, 1, 2, 2, 5]
  end
end
