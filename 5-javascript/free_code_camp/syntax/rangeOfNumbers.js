function rangeOfNumbers(startNum, endNum) {
  if (endNum < startNum) {
    return [];
  } else {
    var rangeNumbers = rangeOfNumbers(startNum, endNum - 1)
    rangeNumbers.push(endNum);
    return rangeNumbers;
  }
};

result = rangeOfNumbers(2, 5)
console.log(result)