function howMany(...args) {
  return "You have passed " + args.length + " arguments." + args[0];
}

console.log(howMany(0, 1, 2)); 
// You have passed 3 arguments.

console.log(howMany("string", null, [1, 2, 3], { })); 
// You have passed 4 arguments.
