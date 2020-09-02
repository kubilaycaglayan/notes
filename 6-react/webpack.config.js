const path = require('path');

module.exports = {
  entry: './egghead/src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, './egghead/dist'),
  },
  module: {
    rules: [
      { test: /\.js$/, exclude: /node_modules/, loader: "babel-loader" }
    ]
  },
  mode: 'development'
};