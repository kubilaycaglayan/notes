def move_1_disk(starting, goal)
  return "#{starting}->#{goal}"
end

def move_n_disks(n, starting, mid, goal)
  if n == 1
    puts move_1_disk(starting, goal)
    
    return
  end

  move_n_disks(n - 1, starting, goal, mid)
  puts move_1_disk(starting, goal)
  move_n_disks(n - 1, mid, starting, goal)
end

move_n_disks(3,1,2,3)