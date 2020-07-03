function Bird(name) {
  this.name  = name;
  this.numLegs = 2;
  let weird = function() {
    console.log('Nasıl bir mantık?')
  }
}

let duck = new Bird("Donald");
let canary = new Bird("Tweety");

console.log(Object.getOwnPropertySymbols(duck))