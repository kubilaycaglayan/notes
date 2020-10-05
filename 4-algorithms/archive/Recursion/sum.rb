def sum(number)
  return 1 if number == 1
  return number + sum(number - 1)
end

p sum(5)