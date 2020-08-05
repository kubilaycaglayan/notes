const result = [];
//Write an object constructor and instantiate the object.
const Guitar = function(brand, year, color) {
  this.brand = brand;
  this.color = color;
  this.year = year;
};

Guitar.prototype.info = function info() {
  return `This is a ${this.year} ${this.color} ${this.brand}.`;
}

const myFirstGuitar = new Guitar('Ibanez', 2005, 'Blue');
const mySecondGuitar = new Guitar('Ibanez', 2008, 'Dark Blue');
result.push(myFirstGuitar, mySecondGuitar.info())

//Describe what a prototype is and how it can be used.

/* A prototype is a method to establish prototypal-inheritance in JavaScript. You can share the methods or properties across objects to form broad compositions. */

//Explain prototypal inheritance.

/* When you call a property on an Object it will first look up that property on the objects own prototype and then go up level by level until Object.prototype. */

//Understand the basic do’s and don’t’s of prototypical inheritance.

const Car = function (brand, year, color) {
  this.brand = brand;
  this.color = color;
  this.year = year;
};
// good
Car.prototype = Object.create(Guitar.prototype);

const saab = new Car('Saab', 2006, 'Black');
result.push(saab.info());

// bad
//Car.prototype = Guitar.prototype

//Explain what Object.create does.
// It returns a new object with the specified prototype and any additional properties you want.

const Plane = function (brand, year, color) {
  this.brand = brand;
  this.color = color;
  this.year = year;
};

const addTheseMethodsToo = {
  infoColor: {
    value() {
      return `This is ${this.color}`;
    },
  },
};

Plane.prototype = Object.create(Guitar.prototype, addTheseMethodsToo);

const boeing = new Plane('Boeing', 2006, 'White');
result.push(boeing.info());
result.push(boeing.infoColor());


console.log(result);