let pp = function(item) {
  console.log(item);
}

function Animal() {
}

Animal.prototype = {
  color: 'black'
}

function Dog() {

}

Dog.prototype = Object.create(Animal.prototype)
Dog.prototype.constructor = Dog;

let puppy = new Dog()

console.log(puppy.color)
