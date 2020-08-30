const path = require('path');

module.exports = {
  entry: './input-manipulation/always-vera-caglayan/src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, './input-manipulation/always-vera-caglayan/dist'),
  },
  module: {
    rules: [
      { test: /\.js$/, exclude: /node_modules/, loader: "babel-loader" }
    ]
  }
};