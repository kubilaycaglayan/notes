const path = require('path');

module.exports = {
  entry: './connect_a.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
  },
};