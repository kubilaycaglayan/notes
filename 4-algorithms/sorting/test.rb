def ranger(num1, num2)
  range = []
  while num1 != num2
    range << num1
    num1 = (num1 + 1) % 24
  end
  range
end

def overlap?(event1, event2)
  p first = ranger(event1.first, event1.last)
  p second = ranger(event2.first, event2.last)
  result = first.any? do |hour|
    second.include? hour
  end

  result
end

p overlap?([0, 1], [12, 15])