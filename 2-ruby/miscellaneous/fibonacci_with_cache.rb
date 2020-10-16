@cache = [1, 1]

def fibonacci(n)
  return @cache[n] if @cache[n]

  @cache[n] = fibonacci(n - 2) + fibonacci(n - 1)
end

fibonacci(5)
