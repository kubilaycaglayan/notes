const deepFreeze = require('deep-freeze');
const expect = require('expect');

const addCounter = (list) => {
  return [...list, 0];
}

const removeCounter = (list, index) => {
  return [
    ...list.slice(0, index),
    ...list.slice(index + 1)
  ];
}

const incrementCounter = (list, index) => {
  return [
    ...list.slice(0, index),
    list[index] + 1,
    ...list.slice(index + 1)
  ]
}

const testAddCounter = (() => {
  const list = [];
  deepFreeze(list);
  expect(addCounter(list)).toEqual([0])
})()

const testRemoveCounter = (() => {
  const list = [0, 5, 6];
  deepFreeze(list);
  expect(removeCounter(list, 2)).toEqual([0, 5])
})()

const testIncrementCounter = (() => {
  const list = [0, 5, 6];
  deepFreeze(list);
  expect(incrementCounter(list, 1)).toEqual([0, 6, 6])
})()