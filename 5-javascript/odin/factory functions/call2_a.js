const Car = function Car(name) {
  this.name = name;
  this.doors = 5;
};

Car.prototype = {
  printName() {
    console.log(`I am a car, I am ${this.name}!`);
  }
};

const mazda = new Car('Mazda');
const subaru = new Car('Subaru');

Car.prototype.printName.call(subaru);
Car.prototype.printName.call(mazda);


