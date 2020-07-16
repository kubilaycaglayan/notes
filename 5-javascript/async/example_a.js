var fs = require('fs') // require is a special function provided by node
var myNumber = undefined // we don't know what the number is yet since it is stored in a file

function addOne() {
  fs.readFile('number.txt', (_err, fileContents) => {
    myNumber = parseInt(fileContents)
    myNumber++
  });
};

addOne();

console.log(myNumber); // logs out undefined -- this line gets run before readFile is done

const logOut = function () {
  console.log(myNumber);
};

setTimeout(logOut, 10); // log out a few ms later
