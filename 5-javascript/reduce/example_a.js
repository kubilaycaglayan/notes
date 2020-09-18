const numbers = [0, 1, 2, 3, 4];

const showArguments = (acc, curr, index, arr) => {
  console.log('Accumulator: ', acc,
    'Current Value: ', curr,
    'Index: ', index,
    'Array: ', arr);

  return acc + curr;
};

numbers.reduce(showArguments);
numbers.reduce(showArguments, 100);
