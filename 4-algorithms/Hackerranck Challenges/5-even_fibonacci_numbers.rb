def even_fibonacci_numbers(limit)
  p fibonacci(limit).select(&:even?).sum
end

def fibonacci(limit)
  fibonacci_numbers = [1, 1]
  (1..limit).reduce(1) do |sum, index|
    break if sum > limit

    fibonacci_numbers << sum
    sum + fibonacci_numbers[index]
  end
  fibonacci_numbers.shift(2)
  fibonacci_numbers
end

even_fibonacci_numbers(100)
