def count(number)
  if number < 0
    return -1
  end

  result = count(number - 1) + 1
  puts number


  return result
end

count(5)