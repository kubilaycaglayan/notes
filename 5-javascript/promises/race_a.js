const req1 = new Promise(function(resolve, reject) {
	setTimeout(function() { resolve('First!'); }, 2000);
});

const req2 = new Promise(function(resolve, reject) {
	setTimeout(function() { reject('Second!'); }, 1000);
});

Promise.race([req1, req2])
  .then(function(one) {
	console.log('Then: ', one);
  })
  .catch(function(one, two) {
	console.log('Catch: ', one);
  });
