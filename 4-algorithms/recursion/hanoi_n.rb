def move_one(starting, goal, result)
  result << "#{starting}->#{goal}\n"
end

def hanoi_steps(number_of_discs, starting = 1, intermediate = 2, goal = 3, result = '', check = number_of_discs)
  return move_one(starting, goal, result) if number_of_discs == 1

  # move top n - 1 discs to the intermediate peg
  hanoi_steps(number_of_discs - 1, starting, goal, intermediate, result, nil)

  # move bottom disk to the target
  hanoi_steps(1, starting, intermediate, goal, result, nil)

  # move n - 1 discs in the intermediate to the target
  hanoi_steps(number_of_discs - 1, intermediate, starting, goal, result, nil)
  print result if number_of_discs == check
end

hanoi_steps(2)
# => 1->2
#    1->3
#    2->3
puts

hanoi_steps(3)
puts
# => 1->3
#    1->2
#    3->2
#    1->3
#    2->1
#    2->3
#    1->3

hanoi_steps(4)

# => 1->2
#    1->3
#    2->3
#    1->2
#    3->1
#    3->2
#    1->2
#    1->3
#    2->3
#    2->1
#    3->1
#    2->3
#    1->2
#    1->3
#    2->3