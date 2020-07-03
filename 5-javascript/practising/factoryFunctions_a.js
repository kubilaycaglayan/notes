const human = function(name) {
  this.name = name;
  const sayName = function() {
    return `My name is ${name}`;
  };
  return { sayName };
}

const kubi = human('Kubilay');
console.log(kubi.sayName());

const javi = human('Javier');
console.log(javi.sayName());
