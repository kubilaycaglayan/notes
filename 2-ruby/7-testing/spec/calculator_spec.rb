require './lib/calculator'

RSpec.describe Calculator do
  describe '#add' do
    it 'returns the sum of two numbers' do
      calculator = Calculator.new
      expect(calculator.add(3, 8)).to eql(11)
    end
    it 'returns the sum of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.add(3, 8, 7)).to eql(18)
    end
  end
  describe '#substract' do
    it 'returns the difference between two numbers' do
      calculator = Calculator.new
      expect(calculator.substract(5,8)).to eql(-3)
    end
    it 'returns the difference between the first number and the sum of all the preceding numbers' do
      calculator = Calculator.new
      expect(calculator.substract(17,3,5,-2)).to eql(11)
    end
  end
  describe '#multiply' do
    it 'returns the product of two numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(5,7)).to eql(35)
    end
    it 'returns the product of multiple numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(1,2,3,4,5)).to eql(120)
    end
  end
  describe '#divide' do
    it 'returns the division of two numbers' do
      calculator = Calculator.new
      expect(calculator.divide(18,2)).to eql(9)
    end
    it 'returns the cascading division of the numbers' do
      calculator = Calculator.new
      expect(calculator.divide(120,4,15)).to eql(2)
    end
  end
end
