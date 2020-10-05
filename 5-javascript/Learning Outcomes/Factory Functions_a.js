// https://www.theodinproject.com/courses/javascript/lessons/factory-functions-and-the-module-pattern
result = [];

// Describe common bugs you might run into using constructors.

// When initializing a new object with a constructor, if you forget to use "new" you won't get any errors and you will pollute the global namespace

// Write a factory method that returns an object.

const Car = (name, year, color) => {
  const sayName = () => `This is a ${name}`;
  return {
    name,
    year,
    color,
    sayName,
  };
};

result.push(Car('Saab', 2006, 'Black'))

// Explain how scope works in JavaScript (bonus points if you can point out what ES6 changed!).

// A function is always creates a new scope::::: And ES6 announced const and let declarations
let number = 13;

(function myFunc() {
  let number = 21;
  let anotherNumber = 55;
  result.push(number, anotherNumber);
})();

result.push(number);
// result.push(number, anotherNumber); => ReferenceError: anotherNumber is not defined

// Explain what Closure is and how it impacts private functions & variables.
// Closure is, in the same scope functions have acces to each other. If we have two functions at the same scope and only one of them is returned out of the inner scope, we can access that returned one but not the not-returned one. But with closure, that returned one can access the non,returned one bcs they are in the same scope. And that way I can use that non-returned function in the returned function, indirectly.


// Describe how private functions & variables are useful.
// We can't directly access them and this prevents making unwanted changes.


// Use inheritance in objects using the factory pattern.

const Carmaker = (name, year, color) => {
  const prototype = Car(name, year, color);
  const info = () => {
    return `This is a ${name}, born in ${year} with a ${color} color.`;
  };
  return Object.assign({}, prototype, { info });
  // or return { ...prototype, info };
};

const mazda = Carmaker('Mazda', 2002, 'Dark Blue');
result.push(mazda, mazda.info(), mazda.sayName(), mazda.name);

// Explain the module pattern.
// Module is wrapping the function with IIFE. Only returned objects can be used outside with the namespace.


// Describe IIFE. What does it stand for?
// Immediately Invoked Function Expressions => (<function here>)();



// Briefly explain namespacing and how it’s useful.
// It is useful when you have large projects and different methods with same names, so you can easily namespace them to not mix.


console.log(result);