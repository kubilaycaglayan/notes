require './hanoi_part1.rb'

# from 1 to 3
def move_3_disks(starting, goal)
  mid = mid(starting, goal)
  result = move_2_disks(starting, mid)
  result += move_1_disk(starting,goal)
  result += move_2_disks(mid,goal)
  result
end
