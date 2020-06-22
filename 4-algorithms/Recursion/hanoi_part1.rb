def move_1_disk(number1, number2)
  return "#{number1}->#{number2}\n"
end

def mid(starting, goal)
  return ([1, 2, 3] - [starting, goal])[0]
end

def move_2_disks(starting, goal)
  mid = mid(starting, goal)

  result = move_1_disk(starting, mid)
  result += move_1_disk(starting, goal)
  result += move_1_disk(mid, goal)
  result
end
