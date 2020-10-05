function filteredArray(arr, elem) {
  const newArr = [];
  // Only change code below this line
  const to_be_deleted = [];
  for (let i = 0; i < arr.length; i++) {
    for (let j = 0; j < arr[i].length; j++) {
      const reducer = 0;
      if (arr[i][j] == elem) {
        to_be_deleted.push(i);
      }
    }
  }

  for (let i = 0; i < to_be_deleted.length; i++) {
    arr.splice(to_be_deleted[(to_be_deleted.length - 1) - i], 1);
  }
  // Only change code above this line
  return arr;
}

console.log(filteredArray([[3, 2, 3], [1, 6, 3], [3, 13, 26], [19, 3, 9]], 3));

console.log(filteredArray([[10, 8, 3], [14, 6, 23], [3, 18, 6]], 18));
// should return [ [10, 8, 3], [14, 6, 23] ]

console.log(filteredArray([['trumpets', 2], ['flutes', 4], ['saxophones', 2]], 2));
// should return [ ["flutes", 4] ]

console.log(filteredArray([[3, 2, 3], [1, 6, 3], [3, 13, 26], [19, 3, 9]], 3));
// should return [ ]
