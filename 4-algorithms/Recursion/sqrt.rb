def sqrt(number)
  sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval)
  mid_point = (min_interval + max_interval) / 2
  sqr_mid = mid_point ** 2
  if sqr_mid == number
    return mid_point
  elsif sqr_mid < number
    sqrt_recursive(number, mid_point, max_interval)
  else
    sqrt_recursive(number, min_interval, mid_point)
  end
end

puts sqrt(25)
puts sqrt(7056)
