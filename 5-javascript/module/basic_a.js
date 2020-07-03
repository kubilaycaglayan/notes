const myModule = (function() {
  'use strict';

  return {
    publicMethod: function() {
      console.log('Hello World!');
    }
  };
}());

myModule.publicMethod(); // outputs 'Hello World'