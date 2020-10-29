system('clear')

@primes_cache = nil

def first_n_prime_numbers(n = 10)
  primes = Set.new(2..n)

  primes.each do |num|
    delete_this = num + num
    while delete_this <= n
      primes.delete(delete_this)
      delete_this += num
    end
  end

  @primes_cache = primes

  primes
end

def number_of_primes(arr)
  first_n_prime_numbers(10000) if @primes_cache.nil?

  arr.count { |n| @primes_cache.include? n }
end

describe 'number_of_primes' do
  let(:numbers1) { [2, 3, 5, 6, 9] }
  let(:numbers2) { [121, 17, 21, 29, 11, 341, 407, 19, 119, 352] }
  let(:numbers3) { [7, 6, 7, 3, 77, 14, 28, 35, 42] }
  it 'returns how many PN are in the given list' do
    expect(number_of_primes numbers1).to be 3
  end
  it 'returns how many PN are in the given list' do
    expect(number_of_primes numbers2).to be 4
  end
  it 'returns how many PN are in the given list' do
    expect(number_of_primes numbers3).to be 3
  end
end

describe 'first_n_prime_numbers' do
  it 'returns a set of first_n_prime_numbers' do
    expect(first_n_prime_numbers 10).to eq Set.new([2, 3, 5, 7])
  end

  it 'returns a set of first_n_prime_numbers' do
    expect(first_n_prime_numbers 22).to eq Set.new([2, 3, 5, 7, 11, 13, 17, 19])
  end
end