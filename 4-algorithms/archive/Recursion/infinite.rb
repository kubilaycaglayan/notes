def count(n = 0)
  return if n > 10
  p n
  count(n + 1)
end

count