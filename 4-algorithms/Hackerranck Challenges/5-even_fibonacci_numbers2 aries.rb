def fibonacci(number)
  fibi = [1,1]
  number.times do |index|
    fibi.last
    index
    fibi << fibi[index] + fibi[index + 1]
    break if fibi.last >= number
  end
  fibi.pop if fibi.last > number
  fibi
end

def even_fibonacci_numbers
  fibonacci(100).select { |fib| fib.even? }.sum
end

p even_fibonacci_numbers
