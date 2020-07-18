const numberDelay = new Promise( function(resolve, reject){
  setTimeout(
    () => { resolve(10) },
    1000
  )
})

const number = new Promise( function(resolve, reject){
  resolve(10)
})

console.log(number);

function printNumberDelay() {
  numberDelay.then(
    (result) => { console.log(result, 'With setTimeOut'); },
  );
}

function printNumber() {
  number.then(
    (result) => { console.log(result); },
  );
}

printNumber();
printNumberDelay()

console.log('Amazing, always async');
