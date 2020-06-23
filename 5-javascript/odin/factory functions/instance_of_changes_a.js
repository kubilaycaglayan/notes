// Constructor
function C() {}
 
// Create object.
var c = new C();
console.log(c instanceof C);
// => true
console.log(c.constructor === C);
// => true
 
// Change prototype
C.prototype = { prototype_prop : "proto"};
console.log(c.constructor === C);
// => true
console.log(c instanceof C);  // instanceof no longer works!
// => false

console.log('SECOND:');

// Constructor
function D() {}
 
// Create object.
var d = new D();
console.log(d instanceof D);
// => true
console.log(d.constructor === D);
// => true
 
// Change prototype
D.prototype.prototype_prop = 'proto';
console.log(d.constructor === D);
// => true
console.log(d instanceof D);  // instanceof no longer works!
// => false