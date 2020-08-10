const sum = require('./sum');

test(
  'Adds 13 to 20 eq to 33',
  () => {
    expect(sum(13, 20)).toBe(33);
  },
);
