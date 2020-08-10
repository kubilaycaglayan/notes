// ASYNC




// What is a callback?
// A cb is a method that is passed into another function uninvoked.
//



// What’s a promise?
// An expected return in the future. A special object that can be chained with then and catch phrases.



// What are circumstances when promises are better than callbacks?
// They can be chained instead of nesting, error management is at the top!




// What does the .then() function do?
// Then takes two callbacks first for resolving the second is for rejecting phase and returns another promise



// ASYNC AND AWAIT
// How do you declare an async function?
async function loggy() {
  await console.log('1')
};
loggy()

const loggy2 = async () => {console.log('2')};
loggy2();

const loggy3 = async function loggy3() {console.log('3')};
loggy3();
console.log('4')

// What does the async keyword do?
// It makes a function promise.



// What does the await keyword do?
// Only used in async functions. It waits for the promise resolve and then go on executing the line.




// What is returned from an async function?
// A promise



// What happens when an error is thrown inside an async function?
// silent
async function thrErr() {
  try {
    throw new Error('Where is this error');
  } catch(err) {
    console.log(err);
  }
}

thrErr();

console.log('5');

// How can you handle errors inside an async function?
// with try and catch blocks


