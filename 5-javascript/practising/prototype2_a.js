const log = (val) => { console.log(val); };

function Car(name) {
  this.name = name;
}
const mazda = new Car('Mazda');
setTimeout(()=>{
  log(mazda.info());
},600);
Car.prototype.info = function () {
  return `This is a ${this.name}.`;
};

const subaru = new Car('Subaru');

log(subaru);
log(subaru.info())