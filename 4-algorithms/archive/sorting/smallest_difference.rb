def smallest_difference(array)
  result = []
  smallest_diff = (array[0] - array[1]).abs
  array.each_with_index do |number1, index|
    for i in (index + 1)...(array.size)
      number2 = array[i]
      next if number1 == number2
      diff = (number1 - number2).abs
      if diff <= smallest_diff
        result = [number1, number2]
        smallest_diff = diff
      end
    end
  end

  result.sort
end

p smallest_difference([-20, -3916237, -357920, -3620601, 7374819, -7330761, 30, 6246457, -6461594, 266854])
# => [-20, 30]