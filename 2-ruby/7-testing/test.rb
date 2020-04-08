class Calculator
  def add(*numbers)
    numbers.inject(0) do |sum, item|
      sum + item.to_i
    end
  end
end
