function Bird() {
  this.name = "Albert";
  this.color  = "blue";
  this.numLegs = 2;
  // "this" inside the constructor always refers to the object being created
}

let blueBird = new Bird();
let redBird = new Bird();
redBird.color = 'red';

console.log(blueBird);
console.log(redBird);