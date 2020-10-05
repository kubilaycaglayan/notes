function log(value) {
  console.log(value);
}

const numbers = [0, 1, 2, 3, 4, 5];

function deleteAt(index) {
  let numbersCopy = [...numbers];
  numbersCopy.splice(index, 1);
  return numbersCopy;
}

function changeAt(index, value) {
  let numbersCopy = [...numbers];
  numbersCopy.splice(index, 1, value);
  return numbersCopy;
}

function changeFrom(index, ...values) {
  let numbersCopy = [...numbers];
  numbersCopy.splice(index, values.length, ...values);
  return numbersCopy;
}

log(deleteAt(2));

log(changeAt(2, 'dam'));

log(changeFrom(2, 'X', 'X'));

log(numbers);
