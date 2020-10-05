
def repeat(arg)
  non_zero = true
  p arg

  if arg == 0
    return false
  end

  return repeat(arg - 1) if repeat(arg - 1) == false
  non_zero
end

puts repeat 2