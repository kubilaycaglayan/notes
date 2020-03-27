def sum_until(m)
  sum = 0
  0.upto(m - 1) do |n|
    sum += n if (n % 3 == 0) || (n % 5 == 0)
  end
  p sum
end

# sum_until 1000

is_divisible_by_3_or_5 = lambda do |n|
  true if (n % 3 == 0) || (n % 5 == 0)
end

divisibles = (1..15).select do |item|
  is_divisible_by_3_or_5.call item
end

puts divisibles.sum
