function secondPromiseFunction(value) {
  const p = new Promise((res, rej) => {
    setTimeout(
      () => {
        console.log('passing by');
        res(value);
      }, 500,
    );
  });

  return p;
}

const prom = new Promise(
  (resolve, reject) => {
    resolve('something');
  },
);

prom
  .then((firstResolveVal) => {
    return secondPromiseFunction(firstResolveVal)
  })
  .then((secondResolveVal) => {
    console.log(secondResolveVal);
  });
