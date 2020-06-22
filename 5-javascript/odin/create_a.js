const person = {
  human: true,
  sex: 'male',
  extra_feature: 12,
  introduce: function() {
    return `Hello I am ${this.name} and ${this.sex}.`;
  }
};

const me = Object.create(person, {
  human: {
    value: true
  },
  sex: {
    value: 'male'
  }
});

me.name = 'Kubilay';
console.log(me.introduce());
console.log(me.extra_feature);
console.log(me.hasOwnProperty('extra_feature'));

const vera = Object.create(person);

vera.name = 'Vera';
vera.sex = 'female';
console.log(vera.introduce());
console.log(vera.extra_feature);
console.log(vera.hasOwnProperty('extra_feature'));
vera.extra_feature = 14;
console.log(vera.extra_feature)
console.log(vera.hasOwnProperty('extra_feature'));