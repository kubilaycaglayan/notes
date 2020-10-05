def move_1_disk(start, goal)
  return "#{start}->#{goal}"
end

def hanoi_steps(number_of_discs, starting, mid, goal)
  if number_of_discs == 1 # BASE CASE
    puts move_1_disk(starting, goal)

    return
  end

  hanoi_steps(number_of_discs - 1, starting, goal, mid) # FIRST STEP
  puts move_1_disk(starting, goal) # SECOND STEP
  hanoi_steps(number_of_discs - 1, mid, starting, goal) # LAST STEP
end

hanoi_steps(2, 1, 2, 3)
# => 1->2
#    1->3
#    2->3

hanoi_steps(3, 1, 2, 3)
# => 1->3
#    1->2
#    3->2
#    1->3
#    2->1
#    2->3
#    1->3

hanoi_steps(4, 1, 2, 3)
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