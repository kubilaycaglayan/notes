const numbers = [...new Array(10).keys(), {name: 'Kubilay'}];
const numbers2 = numbers
const numbers3 = [...numbers];
const numbers4 = Object.assign({}, numbers)
const numbers5 = JSON.parse(JSON.stringify(numbers))
numbers[0] = 'X';
numbers[10].name = 'X';

console.log(numbers)
console.log(numbers2)
console.log(numbers3)
console.log(numbers4)
console.log(numbers5)

const lib = {
  sayName() {
    console.log('Kubilay');
  },
  saySurname() {
    console.log('Çağlayan');
  },
  age: 29,
};

console.log(lib);
console.log(JSON.parse(JSON.stringify(lib)));