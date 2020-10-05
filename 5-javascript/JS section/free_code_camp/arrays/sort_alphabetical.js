function alphabeticalOrder(arr) {
  // Only change code below this line
  return arr.sort(function(a,b) {
    console.log('hey: ', a, ' ', b)
    return b < a ? 0 : -1;
  })

  // Only change code above this line
}
let result = alphabeticalOrder(["a", "d", "c", "a", "z", "g"]);

console.log(result)