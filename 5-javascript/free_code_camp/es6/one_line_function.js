const magic = () => new Date();

console.log(magic())

// doubles input value and returns it
//const doubler = (item) => item * 2;
// the same function, without the argument parentheses
const doubler = item => item * 2;

console.log(doubler(13))