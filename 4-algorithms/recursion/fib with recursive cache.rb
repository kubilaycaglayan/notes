class Fib
  class << self
    def nth(number)
      @cache = [1, 1]
      calc number
      @cache[0..number]
    end

    def calc(index)
      return index if index < 2
      return @cache[index] if @cache[index]

      @cache[index] = calc(index - 2) + calc(index - 1)
    end
  end
end

puts Fib.nth 5