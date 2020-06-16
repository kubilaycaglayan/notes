const sum = (...args) => {
  result = 0;
  for (let i = 0; i < args.length; i++) {
    result += args[i]
  }
  return result;
}

result = sum(0,1,2)
console.log(result)