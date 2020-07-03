class User {
  name1 = 'ben';
  ['say' + 'Hi']() {
    console.log("Hello");
  }

}

new User().sayHi();