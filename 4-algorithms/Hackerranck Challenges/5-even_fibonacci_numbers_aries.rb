def fibonacci_numbers(max)
  fibonacci = [1,2]
  index = 0
  loop do
    new_fibonacci_element = fibonacci[index] + fibonacci[index + 1]
    break if new_fibonacci_element > max
    fibonacci << new_fibonacci_element
    index += 1
  end
  fibonacci
end

def even_fibonacci_numbers(max)
  fibonacci_numbers(max).map.select(&:even?).sum
end

p even_fibonacci_numbers(100)
