// CASE 1
numbers = [1,2,3,4,5,6,7]

result = numbers.sort(function(a,b) { 
  return a - b; 
} );

console.log(result);


// CASE 2
numbers = [1,2,3,4,5,6,7]

result = numbers.sort(function(a,b) { 
  return b - a; 
} );

console.log(result);


// CASE 3
numbers = [1,2,3,4,5,6,7]

result = numbers.sort(function(a,b) { 
  console.log('hey: ', a, ' ', b);
  return -1; 
} );

console.log(result)