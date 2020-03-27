def create_numbers(m)
  numbers = []
  m.times do
    numbers << rand(m * 99)
  end
  numbers.uniq!
  numbers
end

def bubble_sort(integer_or_array)
  case integer_or_array.class.to_s
  when 'Array'
    array = integer_or_array
  when 'Integer'
    array = create_numbers integer_or_array
  end
  print "IN : #{array}\n"
  iteration = array.length - 1
  (0...iteration).each do |_round|
    (0...iteration).each do |i|
      array[i], array[i + 1] = array[i + 1], array[i] if array[i] > array[i + 1]
    end
  end
  print "OUT: #{array}\n"
end
bubble_sort 10
reversed_numbers = (1..10).to_a.reverse
bubble_sort reversed_numbers
