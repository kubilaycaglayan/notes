/* eslint-disable max-classes-per-file */
function log(value) {
  console.log(value);
}

class Car {
  constructor(model, year) {
    this.model = model;
    this.year = year;
  }

  get specialNameGetter() {
    return this.model;
  }
}

class Sedan extends Car {

}

car = new Car('General Cars', 'All Years');
tesla = new Sedan('Tesla', 2012);

log(car);
log(tesla);
log(car.specialNameGetter);
log(tesla.specialNameGetter);
