def count(number)
  if number == 0 # BASE CASE
    return 0
  end

  result = count(number - 1) + 1
  puts number

  return result
end

count(10)
