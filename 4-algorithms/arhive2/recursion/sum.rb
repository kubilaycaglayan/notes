def sum(number, sum = 0)
  return sum if number == 0
  sum(number - 1, sum + number)
end

puts sum(4)
puts sum(10)