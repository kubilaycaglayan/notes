let sayMixin = {
  say(phrase) {
    console.log(phrase);
  },
};

sayMixin.say('konuş');

const sayHi = {
  __proto__: sayMixin,
};

sayHi.say('asd');
