const calculator = (() => {
  const add = (a, b) => a + b;
  const sub = (a, b) => a - b;
  const mul = (a, b) => a * b;
  const div = (a, b) => a / b;
  return {
    add,
    sub,
    mul,
    div,
  };
})();

let result = calculator.add(3,5) // 8
console.log(result)
result = calculator.sub(6,2) // 4
console.log(result)
result = calculator.mul(14,5534) // 77476
console.log(result)