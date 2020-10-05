def fibonacci(num)
  if (num <= 1)
     return num
  end
  p "hey #{num}"
  return fibonacci(num - 2) + fibonacci(num - 1)
end

p fibonacci(8)