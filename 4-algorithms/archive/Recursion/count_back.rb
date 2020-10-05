def count_back(value)
  return if value == 0
  puts value
  value -= 1
  count_back(value)
end

count_back(10)