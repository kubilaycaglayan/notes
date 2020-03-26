class MySolution
    def initialize
        print  prime_dividors 6545555

        puts
        puts "TIME: #{Time.now.strftime("%M:%S")}"
    end

    def dividors m
        dividors = []
        1.upto(m) do |d|
            if (d % (m/10) == 0)
                puts "...calculating dividors #{d}: #{Time.now.strftime("%M:%S")}"
            end
            dividors << d if m % d == 0
        end
        return dividors
    end

    def is_prime? m
        is_prime = true
        is_prime = false if m == 1
        2.upto(m-1) do |d|
            is_prime = false if m % d == 0
        end
        return is_prime
    end

    def prime_dividors m
        dividors = dividors m
        length = dividors.length
        last_report = -1
        prime_dividors = dividors.select do |each|
            where_am_i = (dividors.index(each) / length.to_f).round(1)
            if last_report < where_am_i && ( where_am_i % 0.1 == 0)
                puts "collecting prime dividors among #{each}: #{where_am_i*100}%: #{Time.now.strftime("%M:%S")}"
                last_report = where_am_i
            end
            is_prime? each
        end
        puts "RESULT:"
        return prime_dividors
    end
end

#MySolution.new

class EulerSolution
    def initialize
        n = 600851475143
        puts smallest_prime_factor n
        puts compute n
    end
    def smallest_prime_factor n
        if n >= 2
            for i in (2..(Math.sqrt(n) + 2))
                if n % i == 0
                    return i
                end
            end
            return n
        end
    end
    def compute n
        while true
            p = smallest_prime_factor n
            if p < n
                n = n / p
            else
                return n
            end
        end
    end
end

EulerSolution.new

