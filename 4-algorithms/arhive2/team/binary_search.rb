def sqrt(number)
  sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval)
  middle_point = (min_interval + max_interval) / 2
  target_square = middle_point ** 2
  return middle_point if target_square == number

  if target_square < number
    sqrt_recursive(number, middle_point + 1, max_interval)
  else
    sqrt_recursive(number, min_interval, middle_point - 1)
  end
end

p sqrt(25) # => 5
p sqrt(16) # => 5
p sqrt(256) # => 5
p sqrt(7056) # => something
