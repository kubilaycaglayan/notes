$count = 0

def fibonacci(n)
  $count += 1
  if n < 2
      n
  else
      fibonacci(n-1) + fibonacci(n-2)
  end
end

puts fibonacci(100)

puts $count