const p = function p(...value) {
  // eslint-disable-next-line no-console
  console.log(...value);
};

class CoffeeMachine {
  constructor(power) {
    this._power = power;
  }

  get power() {
    return this._power;
  }
}

const myRedCoffeeMaker = new CoffeeMachine(250);
myRedCoffeeMaker.power = 300;
p(myRedCoffeeMaker);
  