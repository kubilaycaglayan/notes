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

def prime_factors(number)
  primes = first_n_primes(number)
  divisor = 1
  until divisor > number
    p divisor if number % divisor == 0 && primes.include?(divisor)
    divisor += 1
  end
end

prime_factors 100
