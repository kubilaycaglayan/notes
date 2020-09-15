def sliding_maximum(k, numbers)
  maximum = numbers[0]
  result = Array.new(k)

  numbers.each_with_index do |number, index|
    result << number
    if number > maximum
      maximum = number
      maximum_changed = true
      result << maximum if maximum_changed
    end
    break if index == k - 1
  end

  numbers.size.times do |number|
    maximum = number if number > maximum
  end
end

sliding_maximum(3, [1, 3, 5, 7, 9, 2])
# => [5, 7, 9, 9]

# İlk sayıyı en büyük olarak depola
# ikinci sayıyı kıyasya
# 