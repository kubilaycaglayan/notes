function single_move(starting, ending) {
  console.log(`${starting}->${ending}`);
}

function move_n_disks(number, starting = 1, mid = 2, ending = 3) {
  if (number == 1) {
    return single_move(starting, ending);
  }

  move_n_disks(number - 1, starting, ending, mid);
  single_move(starting, ending);
  move_n_disks(number - 1, mid, starting, ending);
}

move_n_disks(2);