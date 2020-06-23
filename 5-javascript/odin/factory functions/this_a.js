let myFunc = {
  pea: 'green',
  rainbow: 'red',
  rdd: function() {
    return console.log(this);
  }
};

console.log(myFunc.pea);
console.log(myFunc.rainbow);
myFunc.rdd()