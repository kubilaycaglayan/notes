words = %w[hello hi welcome mrb four]

def bubble_sort_by(array)
  print "IN : #{array}\n"
  iteration = array.length - 1
  (0...iteration).each do |round|
    swapped = false
    (0...(iteration - round)).each do |i|
      first = array[i]
      second = array[i + 1]
      if yield(first, second).positive?
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end
    break unless swapped
  end
  print "OUT: #{array}\n"
  puts '--'
  puts 'end'
end

small_string_first = lambda do |left, right|
  return left.length - right.length
end
small_number_first = lambda do |left, right|
  return left - right
end

bubble_sort_by(%w[hi hello hey], &small_string_first)
bubble_sort_by(%w[o tw thr four fivee].reverse, &small_string_first)
bubble_sort_by(words, &small_string_first)
bubble_sort_by((1..8).to_a.reverse, &small_number_first)
bubble_sort_by(%w[i w y hello hi hey a x]) do |left, right|
  left.length - right.length
end
