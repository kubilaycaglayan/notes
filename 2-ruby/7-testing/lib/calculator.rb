class Calculator
  def add(*numbers)
    numbers.inject(0) do |sum, item|
      sum + item.to_i
    end
  end

  def substract(*numbers)
    numbers.reduce(numbers[0] * 2) do |result, item|
      result - item
    end
  end

  def multiply(*numbers)
    numbers.reduce(1) do |product, item|
      product * item
    end
  end

  def divide(*numbers)
    numbers << 1
    numbers.reduce(numbers[0] ** 2) do |division, item|
      division / item
    end
  end
end
