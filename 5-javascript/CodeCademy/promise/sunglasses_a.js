const inventory = {
  sunglasses: 1900,
  pants: 1088,
  bags: 1344,
};

function myExecutor(resolve, reject) {
  if (inventory.sunglasses > 2000) {
    resolve('Sunglasses order processed.');
  } else {
    reject('That item is sold out.');
  }
}

function orderSunglasses() {
  return new Promise(myExecutor);
}

const orderPromise = orderSunglasses();

console.log(orderPromise);
