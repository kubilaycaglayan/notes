def sqrt(number)
  sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval)
  target = ((min_interval + max_interval) / 2)

  return target if target ** 2 == number

  if target ** 2 < number
    sqrt_recursive(number, target + 1, max_interval)
  else
    sqrt_recursive(number, 0, target - 1)
  end
end

puts sqrt(25)
puts sqrt(7056)
