def factorial_of(n)
  return 1 if n == 0 or n == 1
  n * factorial_of(n-1)
end

p factorial_of(ARGV[0].to_i)
