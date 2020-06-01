(1..100).each do |i|
  if i % 15 == 0
    puts 'FizzBuzz'
  else
    puts 'Fizz' if i % 3 == 0
    puts 'Buzz' if i % 5 == 0
  end
  puts i if (i % 3 != 0) && (i % 5 != 0)
end
