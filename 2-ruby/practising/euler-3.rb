class MySolution
  def initialize
    print prime_dividors 6_545

    puts
    puts "TIME: #{Time.now.strftime('%M:%S')}"
  end

  def dividors(num)
    dividors = []
    1.upto(num) do |d|
      puts "...calculating dividors #{d}: #{Time.now.strftime('%M:%S')}" if d % (num / 10) == 0
      dividors << d if num % d == 0
    end
    dividors
  end

  def is_prime?(num)
    is_prime = true
    is_prime = false if num == 1
    2.upto(num - 1) do |d|
      is_prime = false if num % d == 0
    end
    is_prime
  end

  def prime_dividors(num)
    dividors = dividors num
    length = dividors.length
    last_report = -1
    prime_dividors = dividors.select do |each|
      where_am_i = (dividors.index(each) / length.to_f).round(1)
      if last_report < where_am_i && (where_am_i % 0.1 == 0)
        puts "collecting prime dividors among #{each}: #{where_am_i * 100}%: #{Time.now.strftime('%M:%S')}"
        last_report = where_am_i
      end
      is_prime? each
    end
    puts 'RESULT:'
    prime_dividors
  end
end

MySolution.new

class EulerSolution
  def initialize
    num = 600_851_475_143
    puts smallest_prime_factor num
    puts compute num
  end

  def smallest_prime_factor(num)
    if num >= 2
      (2..(Math.sqrt(num) + 2)).each do |i|
        return i if (num % i).zero?
      end
      num
    end
  end

  def compute(num)
    loop do
      p = smallest_prime_factor num
      return num unless p < num
      num /= p
    end
  end
end

EulerSolution.new