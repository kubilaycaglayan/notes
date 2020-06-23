const personFactory = (name, age) => {
  const sayHello = () => console.log('hello!');
  return { name, age, sayHello }
}

const jeff = personFactory('Jeff', 27);

console.log(jeff)
console.log(jeff.age)
console.log(jeff.name)
jeff.sayHello()