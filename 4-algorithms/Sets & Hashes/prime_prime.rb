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

def prime_factors(number, primes)
  result = []
  divisor = 1
  until divisor > number
    result << divisor if number % divisor == 0 && primes.include?(divisor)
    divisor += 1
  end
  result
end

def find_max(hash)
  max = 0
  result = nil
  hash.each do |key, val|
    if val > max
      max = val
      result = key
    end
  end
  result
end

@@primes = first_n_primes(10000)

def prime_prime(array)
  prime_factor_count = Hash.new(0)
  array.each do |num|
    prime_factors(num, @@primes).each do |prime_factor|
      prime_factor_count[prime_factor] += 1
    end
  end
  find_max prime_factor_count
end

puts prime_prime([2, 3, 5, 6, 9])
# => 3

puts prime_prime([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# => 11

puts prime_prime([7, 6, 7, 3, 77, 14, 28, 35, 42])
# => 7