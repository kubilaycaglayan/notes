/* eslint-disable max-classes-per-file */
// CLASSES
// https://www.theodinproject.com/courses/javascript/lessons/classes
const result = []


// Describe the pros and cons of using classes in JavaScript.
// It is more familiar for the people who are coming from different languages. But actually is just a syntactical sugar on top of prototypal inheritance in JS. So it can be misleading about what's really happening with the objects.


// Briefly discuss the difference between JavaScript’s object creation differs from a language like Java or Ruby.
// In Ruby objects are inherited from their parents and there is no compositional behaviour. JavaScript is more like a composition of properties in an object and you can choose freely what properties to use in an object.



// Explain the differences between using a class to define a constructor and other prototype methods.
// When inheriting, classes uses "extend" kw and plain constructors use prototype, Object.create() methods.



// Explain what “getters” & “setters” are.
// They are special methods inside a class that are giving us the ability to get and set variables in a class with certain validations.



// Understand what computed names and class fields are
// CN is naming a function with string literals ['my' + 'Name']() {}.
// class fields are making available to put variables inside a class(other than just functions)



// Describe function binding.
// binding, fixating the "this" keyword to a specific function. To make it more stable in the moment of invoking in different contexts.



// Be able to use inheritance with classes.

class Car {
  constructor(name) {
    this.name = name;
  }

  info() {
    return `This is a ${this.name}`
  }
}

const mazda = new Car('Mazda');
result.push(mazda, mazda.info());

class Subaru extends Car {
  constructor() {
    super('Subaru');
    this.fourByFour = true;
  }

  isFourTraction() {
    return this.fourByFour;
  }

  about() {
    return `${this.name} is famous with the Impreza model.`;
  }
}

const subaru = new Subaru();
result.push(subaru, subaru.info(), subaru.isFourTraction(), subaru.about());

// Briefly talk about the conflict in JS with functional programming and classes.
// Class KW is just a syntactical sugar on top of what already exists in JS, object constructors and prototypal inheritance. It can mislead people. And in the big frameworks, Class KW is crops up.


console.log(result);