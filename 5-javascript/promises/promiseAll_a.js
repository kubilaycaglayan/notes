const req1 = new Promise(function(resolve, reject) {
	setTimeout(function() { resolve('First!'); }, 4000);
});

const req2 = new Promise(function(resolve, reject) {
  setTimeout(function() { reject('Second!'); }, 2000);
});

const req3 = new Promise(function(resolve, reject) {
  setTimeout(function() { resolve('Third!'); }, 1000);
});

Promise.all([req1, req2, req3])
  .then(function(results) {
    results.forEach((result) => {
      console.log(result)
    })
    console.log('Then: ', results);
  })
  .catch(function(err) {
    console.log('Catch: ', err);
  });