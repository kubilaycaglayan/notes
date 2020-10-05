const prom1 = new Promise.resolve('Atilla');
const prom2 = new Promise.resolve('Berke');

const result1 = await prom1;

console.log(result1);