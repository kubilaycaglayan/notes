// Does hoisting exist in JavaScript? NO if it is function expression

console.log(multiply(5, 10))

const multiply = function multiply(number1, number2) {
  return number1 * number2
};
