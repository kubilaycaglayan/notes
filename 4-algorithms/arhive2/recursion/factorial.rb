def fact(num)
  return 1 if num <= 1
  num * fact(num - 1)
end

p fact 10