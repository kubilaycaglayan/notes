values = [42, 'a', 'r', 9, 5, 10_022, 8.7, 'sharon', 'Libya', 'Mars', '12', 98, rand + rand, { dog: 'cat' }, 100, nil, 200.0000, Object, 680, 3.14, 'Steve', 78, 'Argo'].shuffle

54.times do
  values << (rand * 100).floor
end

until values.empty?
  retries = 1
  begin
    break if values.empty?

    a = values.pop
    b = values.pop
    a + b
  rescue Exception => e
    if retries > 0
      retries -= 1
      retry
      end
    puts "ERROR: #{e}"
  else
    puts "00 a + b is #{a + b}"
  ensure
    sleep 0.01
  end
end

#while 1
# puts "Enter a number>>"
# begin
#   num = Kernel.gets.match(/\d+/)[0]
# rescue Exception=>e
#   puts "Erroneous input!"
#   puts e
#   puts "\tTry again...\n"
# else
#   puts "#{num} + 1 is: #{num.to_i+1}"
# end
#end
