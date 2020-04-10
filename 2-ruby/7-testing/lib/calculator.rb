class Calculator
  def add(*numbers)
    numbers.reduce(:+)
  end

  def substract(*numbers)
    numbers.reduce(:-)
  end

  def multiply(*numbers)
    numbers.reduce(:*)
  end

  def divide(*numbers)
    numbers << 1
    numbers.reduce(numbers[0] ** 2) do |division, item|
      division / item
    end
  end
end
puts "Hello World!"