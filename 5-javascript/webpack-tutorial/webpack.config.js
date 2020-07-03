const path = require('path');

module.exports = {
  entry: "./src/index.js",
  output: {
    filename: "bundle.js",
    path: path.join(__dirname, "dist")
  },
  module: {
    rules: [
      {
        test: /asd/,
        use: ["file-loader"],
      }
    ]
  }
};