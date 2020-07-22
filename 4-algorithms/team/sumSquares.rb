def sum_squares(number)
  if number == 1
    puts 1
    return 1
  end

  puts number ** 2
  result = number ** 2 + sum_squares(number - 1)

  return result

end

sum_squares(10)

# 3^2 + 2^2 + 1^2 = 14