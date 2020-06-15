# Define a recursive function that takes an argument n 
# and returns the fibonacci value of that position. 
# The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... So fib(5) 
# should return 5 and fib(6) should return 8.

def fibonacci(number, fibonacci_numbers=[1,1])
  if number < 3
    puts fibonacci_numbers[-1]
  else
    fibonacci_numbers << fibonacci_numbers[-1] + fibonacci_numbers[-2]
    fibonacci(number - 1, fibonacci_numbers)
  end
end

fibonacci(0)