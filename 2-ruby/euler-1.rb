def sum_until m
    sum = 0
    0.upto(m-1) do |n|
        if ( n % 3 == 0 ) || ( n % 5 == 0 )
            sum += n
        end
    end
    p sum
end

sum_until 1000