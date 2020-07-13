def how_many_nodes_are_there_in_a_level(level)
  return 0 if level < 1
  number_of_nodes = 0
  level.times do |index|
    number_of_nodes += 2 ** index
  end
  number_of_nodes
end

p how_many_nodes_are_there_in_a_level(2)