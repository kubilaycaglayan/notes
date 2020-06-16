function Bird(name) {
  this.name  = name;
}

Bird.prototype.numLegs = 2;

let cambaz = new Bird();

console.log(cambaz.numLegs)