def move_only_one_disk(start, ending)
  "#{start}->#{ending}"
end

def move_any_number_of_disks(number_of_disks, starting_point, ending_point, mid_point)
  if number_of_disks == 1
    $count += 1
    move_only_one_disk(starting_point, ending_point)

    return
  end

  move_any_number_of_disks(number_of_disks - 1, starting_point, mid_point, ending_point)
  move_only_one_disk(starting_point, ending_point)
  $count += 1
  move_any_number_of_disks(number_of_disks - 1, mid_point, ending_point, starting_point)
end

16.times do |index|
  $count = 0
  move_any_number_of_disks(index + 1, 1, 3, 2)
  puts "FOR #{index + 1} DISKS: #{$count} CALL"
end
