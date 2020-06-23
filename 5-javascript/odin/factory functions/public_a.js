const Module = (function () {
  var myModule = {};
  var privateMethod = function () {
    console.log('Helloooo')
  };
  myModule.publicMethod = function () {

  };
  myModule.anotherPublicMethod = function () {

  };
  return myModule; // returns the Object with public methods
})();

// usage
Module.publicMethod();