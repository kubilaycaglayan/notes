const human = {
  sayName: function sayName() {
    return `My name is ${this.name}`;
  },
};

const kubi = Object.create(human);
kubi.name = 'Kubilay';
console.log(kubi.sayName());

const javi = Object.create(human);
javi.name = 'Javier';
console.log(javi.sayName());
