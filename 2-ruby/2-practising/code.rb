puts 0

array_3 = [1, 2, 'asd', 4, 5, 6, 7, '8', 9, 10, :luleburgaz, 11]

array = []

1.upto(10) do |x|
  array << x
end

# puts array

even_filter = lambda do |x|
  x.even?
end

odd_filter = lambda do |x|
  x.odd?
end

symbol_filter = lambda do |x|
  x.is_a? String
end

array2 = array_3.select(&symbol_filter)

puts '-- a2 --'
puts array2
puts '-- -- --'
