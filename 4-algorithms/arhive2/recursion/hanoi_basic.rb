def move(starting, goal)
  intermediate = ([1, 2, 3] - [starting, goal]).first
  # Move the top disk to the “intermediate peg” (the one not used).
  result = "#{starting}->#{intermediate} "
  # Move the large disk to the goal peg (See case 1).
  result << "#{starting}->#{goal} "
  # Move the small disk to the goal peg (See case 1).
  result << "#{intermediate}->#{goal}"
end

puts move(1, 3)
# => 1->2 1->3 2->3

puts move(2, 3)
# => 2->1 2->3 1->3