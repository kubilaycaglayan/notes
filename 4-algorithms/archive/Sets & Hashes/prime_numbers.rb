  require 'set'

  def arr_to_n(number)
    (1..number).to_a
  end

  def sieve(arr, number, const = number)
    return if number > arr.last
    arr.delete(number) unless number == const # [OPTIMIZABLE]
    sieve(arr, number + const, const)
    arr
  end

  def prime?(num)
    return false if num == 1
    return true if num == 2
    (2...num).to_a.each do |divisor|
      return false if num % divisor == 0
    end
    return true
  end

  def first_n_primes(num)
    primes = (2..num).to_a
    primes.each do |number|
      if prime? number
        primes = sieve(primes, number)
      else
        primes.delete(number)
      end
    end
    return Set.new primes
  end

  def number_of_primes(arr)
    primes = first_n_primes 10000
    arr.count {|element| primes.include? element }
  end

puts number_of_primes([2, 3, 5, 6, 9])
# => 3

puts number_of_primes([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# => 4

puts number_of_primes([7, 6, 7, 3, 77, 14, 28, 35, 42])
# => 3