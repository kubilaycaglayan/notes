for (let i = 0; i < 10; i += 1) {
  console.log(i)
  for (let j = 0; j < 3; j += 1) {
    console.log('  ', j);
    break
  }
}