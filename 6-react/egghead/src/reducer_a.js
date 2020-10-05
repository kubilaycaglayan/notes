const expect = require('expect');

const reducer = (() => {
  const INCREMENT = 'INCREMENT';
  const DECREMENT = 'DECREMENT';

  const counter = (state = 0, action) => {
    switch (action.type) {
      case INCREMENT:
        return state + 1;
      case DECREMENT:
        return state - 1;
      default:
        return state;
    }
  }

  expect(
    counter(1, {type: INCREMENT})
  ).toEqual(2)

  expect(
    counter(2, {type: DECREMENT})
  ).toEqual(1)

  expect(
    counter(undefined, {})
  ).toEqual(0)

  expect(
    counter(1, {type: 'something'})
  ).toEqual(1)
})()

