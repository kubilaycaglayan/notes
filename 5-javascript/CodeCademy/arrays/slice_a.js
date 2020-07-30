function log(value) {
  console.log(value);
}

let me = {
  name: 'Kubilay',
  height: 187,
  eyeColor: 'Brown',
  weight: 105,
}

const numbers = [0, 1, 2, 3, 4, 5];

const collection = [
  12,
  true,
  me,
  numbers,
];

const copyCollection = collection.slice(0);
log('Copy of Collection');
log(copyCollection);

collection[2] = 'X';
log('After changing the collection\'s first item');
log(copyCollection);

me.weight = 82;  // This reflects a change in the copied array
log('After changing the me object attribute');
log(copyCollection);

me = 'XX';
log('After changing me object');
log(me)
log(copyCollection);