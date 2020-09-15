require './hanoi_part2.rb'
$count = 0

def move_n_disks(n, starting = 1, mid = 2, goal = 3)
  $count += 1
  # base case:
  # if there's only one disk, just print the move text from start to goal
  if n == 1
    puts move_1_disk(starting, goal)
    # stop the current step
    return
  end
  # 
  # step 1: move the top disks(number_of_discs - 1) of the current sub-problem onto the intermediate peg
  move_n_disks(n - 1, 1, 3, 2)
  # step 2: move the largest disk of the current sub-problem onto the goal peg
  puts move_1_disk(1,3)
  # step 3: move the intermediate disks(number_of_dics - 1) of the current sub-problem onto the goal peg
  move_n_disks(n-1, 2, 1, 3)

end

puts move_n_disks(4)

puts '' , $count
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