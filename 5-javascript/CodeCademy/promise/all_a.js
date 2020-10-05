const prom1 = new Promise((res, rej) => {
  setTimeout(
    () => {
      console.log('processing...');
      res('Yüzbaşı');
    },
    500,
  );
});

const prom2 = new Promise((res, rej) => {
  setTimeout(
    () => {
      console.log('processing...');
      res('Binbaşı');
    },
    700,
  );
});

const prom3 = () => {
  return new Promise((res, rej) => {
    setTimeout(
      () => {
        console.log('processing...');
        res('Yarbay');
      },
      800,
    );
  });
};


Promise.all([prom1, prom2, prom3()])
  .then(
    result => console.log(result)
  )