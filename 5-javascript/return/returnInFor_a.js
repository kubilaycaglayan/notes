const returnInFor = () => {
  console.log('start');

  for (let i = 0; i < 8; i += 1) {
    console.log(i);
    if (i === 4) return false;
  }

  console.log('end');
};

console.log(returnInFor());
