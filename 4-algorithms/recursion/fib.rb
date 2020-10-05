def fib_at(num)
  return 0 if num == 0
  return 1 if num == 1

  fib_at(num - 2) + fib_at(num - 1)
end

p fib_at 0
p fib_at 1
p fib_at 2
p fib_at 3
p fib_at 4
p fib_at 5
p fib_at 6