const path = require('path');

module.exports = {
  entry: './redux/src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, './redux/dist'),
  },
  module: {
    rules: [
      { test: /\.js$/, exclude: /node_modules/, loader: "babel-loader" }
    ]
  }
};