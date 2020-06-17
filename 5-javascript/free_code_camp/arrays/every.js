function checkPositive(arr) {
  // Only change code below this line
  return arr.every(function(currentValue) {
    console.log(currentValue)
    return currentValue > 0;
  })

  // Only change code above this line
}
var result = checkPositive([1, 2, 3, -4, 5]);
console.log(result);